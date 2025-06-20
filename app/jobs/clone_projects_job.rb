class CloneProjectsJob < ApplicationJob
  queue_as :default

  def perform
    submissions = YAML.load_file(Rails.root.join("submissions.yml"))
    urls = submissions["projects"].map do |url|
      url = url.chomp("/")
      url = "#{url}.git" unless url.end_with?(".git")
      url
    end

    queue = Queue.new
    urls.each { |url| queue << url }

    threads = 5.times.map do
      Thread.new do
        while url = queue.pop(true) rescue nil
          org, repo = url.gsub("https://github.com/", "").gsub(".git", "").split("/")
          org = org.downcase
          repo = repo.downcase
          target_dir = File.join(Rails.root, "content", "projects", org, repo)

          if Dir.exist?(target_dir) && Dir.exist?(File.join(target_dir, ".git"))
            Rails.logger.info "Pulling latest for #{org}/#{repo}..."
            run_git_command([ "git", "-C", target_dir, "pull" ])
          else
            Rails.logger.info "Cloning #{org}/#{repo}..."
            run_git_command([ "git", "clone", url, target_dir ])
          end
        end
      end
    end

    threads.each(&:join)

    Rails.logger.info "Done cloning and updating all projects!"
  end

  private

  def run_git_command(command)
    pid = nil
    begin
      pid = Process.spawn(*command,
        out: :close,
        err: :close,
        pgroup: true
      )

      # Wait for process with timeout
      Timeout.timeout(300) do # 5 minute timeout
        Process.wait(pid)
      end

      unless $?.success?
        Rails.logger.warn "Git command failed: #{command.join(' ')}"
      end
    rescue Timeout::Error
      Rails.logger.error "Git command timed out: #{command.join(' ')}"
      if pid
        begin
          Process.kill("TERM", -Process.getpgid(pid)) # Kill process group
          sleep(5)
          Process.kill("KILL", -Process.getpgid(pid)) # Force kill if still running
        rescue Errno::ESRCH, Errno::EPERM
          # Process already dead or no permission
        end
      end
    rescue => e
      Rails.logger.error "Git command error: #{e.message}"
    ensure
      if pid
        begin
          Process.wait(pid, Process::WNOHANG) # Clean up zombie if still there
        rescue Errno::ECHILD
          # Process already reaped
        end
      end
    end
  end
end

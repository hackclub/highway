class CloneProjectsJob < ApplicationJob
  queue_as :default

  def perform
    submissions = YAML.load_file(Rails.root.join("submissions.yml"))

    submissions["projects"].each do |url|
      url = url.chomp("/")
      url = "#{url}.git" unless url.end_with?(".git")

      org, repo = url.gsub("https://github.com/", "").gsub(".git", "").split("/")
      org = org.downcase
      repo = repo.downcase

      target_dir = File.join(Rails.root, "content", "projects", org, repo)

      if Dir.exist?(target_dir) && Dir.exist?(File.join(target_dir, ".git"))
        Rails.logger.info "Pulling latest for #{org}/#{repo}..."
        system("cd '#{target_dir}' && git pull")
      else
        Rails.logger.info "Cloning #{org}/#{repo}..."
        system("git clone #{url} '#{target_dir}'")
      end
    end

    Rails.logger.info "Done cloning and updating all projects!"
  end
end

namespace :projects do
  desc "Clone or update all projects from submissions.yml"
  task clone: :environment do
    CloneProjectsJob.perform_now
  end

  desc "Remove all repos in content/projects except for hackclub/awesome-project"
  task drop: :environment do
    base_dir = Rails.root.join("content/projects")
    Dir.glob(base_dir.join("*/*")).each do |dir|
      next unless File.directory?(dir)
      # Keep hackclub/awesome-project
      if dir == base_dir.join("hackclub/awesome-project").to_s
        next
      end
      FileUtils.rm_rf(dir)
      puts "Removed #{dir}"
    end
    puts "Done removing all projects except hackclub/awesome-project."
  end
end

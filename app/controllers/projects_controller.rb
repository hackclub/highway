class ProjectsController < ApplicationController
  include HasFrontmatter

  def index
    @projects = Project.all

    CloneProjectsJob.perform_later if @projects.empty?
  end

  def show
    @project = Project.find(params[:user], params[:project_name])
    render_not_found unless @project.present?
  end

  def new
  end

  private

  def load_projects
    projects = []
    Dir.glob(Rails.root.join("content/projects/*/*/journal.md")).each do |file|
      content = File.read(file)
      metadata, _ = parse_frontmatter(content)

      # Extract repo and project name from path
      path_parts = file.split("/")
      repo = path_parts[-3]
      project_name = path_parts[-2]

      projects << {
        repo: repo,
        project_name: project_name,
        title: metadata["title"],
        author: metadata["author"],
        description: metadata["description"],
        created_at: metadata["created_at"]
      }
    end
    projects.sort_by { |p| p[:created_at] }.reverse
  end

  def load_project(repo, project_name)
    file_path = Rails.root.join("content/projects", repo, project_name, "journal.md")
    return nil unless File.exist?(file_path)

    content = File.read(file_path)
    metadata, markdown_content = parse_frontmatter(content)

    {
      repo: repo,
      project_name: project_name,
      title: metadata["title"],
      author: metadata["author"],
      description: metadata["description"],
      created_at: metadata["created_at"],
      content: render_markdown(markdown_content)
    }
  end

  def render_not_found
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end

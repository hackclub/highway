class Project
  include MarkdownRenderable
  include HasFrontmatter
  attr_reader :user, :project_name, :title, :author, :description, :created_at, :content

  def initialize(attributes = {})
    @user = attributes[:user]
    @project_name = attributes[:project_name]
    @title = attributes[:title]
    @author = attributes[:author]
    @description = attributes[:description]
    @created_at = attributes[:created_at]
    @content = attributes[:content]
  end

  def self.highlighted_projects
    @highlighted_projects ||= YAML.load_file(Rails.root.join("config/highlighted_projects.yml"))
  end

  def is_highlighted?
    self.class.highlighted_projects.include?(github_slug)
  end

  def name
    title.presence || project_name.titleize
  end

  def github_slug
    "#{user}/#{project_name}"
  end

  def github_repo
    "https://github.com/#{github_slug}"
  end

  def author_display
    return "@#{user}" if author.blank?
    author
  end

  def user_link
    "https://github.com/#{user}"
  end

  def created_at_date
    return nil unless created_at
    return created_at if created_at.is_a?(Date)
    Date.parse(created_at) rescue nil
  end

  def formatted_created_at
    return nil unless created_at_date
    created_at_date.strftime("%B %d, %Y")
  end

  def has_creation_date?
    created_at_date.present?
  end

  def has_journal?
    dir = Rails.root.join("content/projects", user, project_name)
    Dir.glob(File.join(dir, "*")).any? { |f| File.basename(f).downcase == "journal.md" }
  end

  def self.all
    Dir.glob(Rails.root.join("content/projects/*/*")).map do |dir|
      next unless File.directory?(dir)
      path_parts = dir.split("/")
      user = path_parts[-2]
      project_name = path_parts[-1]
      journal_path = Dir.glob(File.join(dir, "*")).find { |f| File.basename(f).downcase == "journal.md" }
      metadata = {}
      if journal_path && File.exist?(journal_path)
        content = File.read(journal_path)
        metadata, _ = parse_frontmatter(content)
      end
      unless Rails.env.development?
        next if user == "hackclub" && project_name == "awesome-project"
      end
      new(
        user: user,
        project_name: project_name,
        title: metadata["title"],
        author: metadata["author"],
        description: metadata["description"],
        created_at: metadata["created_at"]
      )
    end.compact
  end

  def self.working
    all.select do |project|
      journal_path = Rails.root.join("content/projects", project.user, project.project_name, "journal.md")
      next false unless File.exist?(journal_path)
      content = File.read(journal_path)
      metadata, _ = parse_frontmatter(content)
      required_fields = [ "title", "author", "description", "created_at" ]
      next false unless required_fields.all? { |field| metadata[field].present? }
      project.instance_variable_set(:@title, metadata["title"])
      project.instance_variable_set(:@author, metadata["author"])
      project.instance_variable_set(:@description, metadata["description"])
      project.instance_variable_set(:@created_at, metadata["created_at"])
      true
    end
  end

  def self.find(user, project_name)
    dir = Rails.root.join("content/projects", user.downcase, project_name.downcase)
    journal_path = Dir.glob(File.join(dir, "*")).find { |f| File.basename(f).downcase == "journal.md" }
    return nil unless journal_path
    content = File.read(journal_path)
    metadata, markdown_content = parse_frontmatter(content)
    new(
      user: user,
      project_name: project_name,
      title: metadata["title"],
      author: metadata["author"],
      description: metadata["description"],
      created_at: metadata["created_at"],
      content: render_markdown(markdown_content, user, project_name)
    )
  end

  def has_bom?
    File.exist?(Rails.root.join("content/projects", user, project_name, "bom.csv"))
  end

  def bom_csv
    path = Rails.root.join("content/projects", user, project_name, "bom.csv")
    File.exist?(path) ? File.read(path) : nil
  end
end

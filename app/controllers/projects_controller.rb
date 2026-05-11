class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    if params[:q].present?
      q = params[:q].downcase
      @projects = @projects.select do |p|
        p.name.to_s.downcase.include?(q) ||
        p.author.to_s.downcase.include?(q) ||
        p.description.to_s.downcase.include?(q)
      end
    end
    CloneProjectsJob.perform_later if @projects.empty?
  end

  def show
    @project = Project.find(params[:user], params[:project_name])
    render_not_found unless @project
  end

  private

  def render_not_found
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end

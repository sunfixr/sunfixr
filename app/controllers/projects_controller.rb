class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def home
    @project = Project.find_by_slug(params[:name].downcase)
  end

end

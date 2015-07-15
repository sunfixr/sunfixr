class ProjectController < ApplicationController
  before_filter :get_project, except: :index
  def index
    @projects = Project.all
  end

  def show

  end
  def update
    unless @project.update(project_params)
      flash[:alert] = @project.errors.full_messages.join("<br/>\n")
    end
    if params[:return_to]
      redirect_to params[:return_to]
    else
      redirect_to project_path(params[:id])
    end

  end


  private
  def project_params
    params.require(:project).permit(
        project_pics_attributes: [:id, :picture, :picture_cache, :notes],
        users_attributes: [:id, :role],
        users_projects_attributes: [:id, :role],
        attachments_attributes: [:id, :attachment, :attachment_cache, :notes]
    )
  end
  def get_project
    @project = params[:id].match(/^[0-9]*$/) ? Project.find(params[:id]) : Project.find_by_slug(params[:id].downcase)
  end
end

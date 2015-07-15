class Project::ProjectPicsController < ApplicationController
  before_filter :get_project, :authorize
  def index

  end
  def show

  end
  def destroy
    ProjectPic.find(params[:id]).destroy
    flash[:notice] = "Picture deleted"
    redirect_to project_project_pics_path(params[:project_id])
  end


  private

  def authorize
    authorize! :manage_pictures, @project, message: 'You are not authorized to manage project pictures.'
  rescue => e
    redirect_to project_path(@project), status: 302,  alert: e.message
  end
end

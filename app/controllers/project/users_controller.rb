class Project::UsersController < ApplicationController
  before_filter :get_project
  before_filter :authorize
  def index
  end

  def show
  end

  def destroy
    UsersProject.find(params[:id]).destroy
    flash[:notice] = "User removed from site"
    redirect_to project_users_path(params[:project_id])
  end

  def invite
    InvitationMailer.invite(params,current_user).deliver_later
    flash[:notice] = "Email has been sent to  #{params[:emails]}"
    redirect_to params[:return_to] || project_users_path(params[:project_id])
  end

  private
  def project_params
    params.require(:project).permit(
        users_projects_attributes: [:role]
    )
  end

  def authorize
    authorize! :manage_users, @project, message: 'You are not authorized to manage users.'
  rescue => e
    redirect_to project_path(@project), status: 302,  alert: e.message
  end
end

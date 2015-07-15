class Project::AttachmentsController < ApplicationController
  before_filter :get_project
  before_filter :authorize, except: :list
  def index

  end

  def show

  end

  def list

  end

  def destroy
    Attachment.find(params[:id]).destroy
    flash[:notice] = "Attachment deleted"
    redirect_to project_attachments_path(params[:project_id])
  end


  private



  def authorize
    authorize! :manage_files, @project, message: 'You are not authorized to manage project files.'
  rescue => e
    redirect_to project_path(@project), status: 302,  alert: e.message
    true
  end

end

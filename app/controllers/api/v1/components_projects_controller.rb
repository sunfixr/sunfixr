class Api::V1::ComponentsProjectsController < ApplicationController
  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(installation_params)
    # @project.address.name ||= @project.name
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Component was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to installations_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
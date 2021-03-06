class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  def home
    @project = Project.find_by_slug(params[:name].downcase)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show

  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.address = Address.new
    @companies = Company.all
  end

  # GET /projects/1/edit
  def edit

  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
   # @project.address.name ||= @project.name
    respond_to do |format|
      if @project.save
        format.html { redirect_to api_v1_project_url(@project), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to api_v1_project_url(@project), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to params[:return_to] ? params[:return_to] : api_v1_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404.html", layout: false,  :status => 404 }
        format.json { render json: {error: 'project not found.'}, status: :not_found }
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(
          :name, :slug, :company_id, :description, :install_date, :component_ids => [],
          :component_attributes => [:id,:name,:description,:company_id,:serial_number,:part_number],
          :company_attributes => [:id,:name],
          :address_attributes => [:id,:addressable_id,:addressable_type,:name,:address1,:address2,:city,:state,:postal_code,:country_id,:latitude,:longitude],
          :profile => [:profile, :profile_id, :profile_type],
          :attachments_attributes => [:id, :attachment, :attachment_cache, :notes]
      )
    end
end

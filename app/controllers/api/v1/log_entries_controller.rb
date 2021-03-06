class Api::V1::LogEntriesController < ApplicationController
  before_action :set_log_entry, only: [:show, :edit, :update, :destroy]

  # GET /log_entries
  # GET /log_entries.json
  def index
    @log_entries = LogEntry.all
  end

  # GET /log_entries/1
  # GET /log_entries/1.json
  def show
  end

  # GET /log_entries/new
  def new
    @log_entry = LogEntry.new
  end

  # GET /log_entries/1/edit
  def edit
  end

  # POST /log_entries
  # POST /log_entries.json
  def create
    @log_entry = LogEntry.new(log_entry_params)

    respond_to do |format|
      if @log_entry.save
        format.html { redirect_to api_v1_log_entry_url(@log_entry), notice: 'Log entry was successfully created.' }
        format.json { render :show, status: :created, location: @log_entry }
      else
        format.html { render :new }
        format.json { render json: @log_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /log_entries/1
  # PATCH/PUT /log_entries/1.json
  def update
    respond_to do |format|
      if @log_entry.update(log_entry_params)
        format.html { redirect_to api_v1_log_entry_url(@log_entry), notice: 'Log entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @log_entry }
      else
        format.html { render :edit }
        format.json { render json: @log_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /log_entries/1
  # DELETE /log_entries/1.json
  def destroy
    @log_entry.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_log_entries_url, notice: 'Log entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log_entry
      @log_entry = LogEntry.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404.html", layout: false,  :status => 404 }
        format.json { render json: {error: 'Log Entry not found.'}, status: :not_found }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_entry_params
      params.require(:log_entry).permit(:user, :project_id, :component_id, :comments)
    end
end

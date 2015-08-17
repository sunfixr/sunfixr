class Api::V1::AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(attachment_params)

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to back_to(api_v1_attachment_url(@attachment)), notice: 'attachment was successfully created.' }
        format.json { render :show, status: :created, location: @attachment }
      else
        format.html { render :new }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to  back_to(api_v1_attachment_url(@attachment)), notice: 'attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to back_to(api_v1_attachments_url), notice: 'attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_attachment
    @attachment = Attachment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", layout: false,  :status => 404 }
      format.json { render json: {error: 'attachment not found.'}, status: :not_found }
    end

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attachment_params
    params.require(:attachment).permit(:id, :attachment, :attachment_cache, :notes)
  end
end

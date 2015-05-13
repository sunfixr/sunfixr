class ComponentsInstallationController < ApplicationController
  # POST /installations
  # POST /installations.json
  def create
    @installation = Installation.new(installation_params)
    # @installation.address.name ||= @installation.name
    respond_to do |format|
      if @installation.save
        format.html { redirect_to @installation, notice: 'Component was successfully created.' }
        format.json { render :show, status: :created, location: @installation }
      else
        format.html { render :new }
        format.json { render json: @installation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @installation.destroy
    respond_to do |format|
      format.html { redirect_to installations_url, notice: 'Installation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
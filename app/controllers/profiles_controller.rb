class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
     @profile = Profile.new(profile_params)
     if @profile.save
       redirect_to @profile, notice: 'Photo saved'
     else
       flash[:error] = 'Photo could not be saved'
       redirect_to(:back)
     end
   end

  private

  def set_log_entry
    @profile = Profile.find(params[:id])
  end

   def profile_params
     params.require(:profile).permit(:profile, :profile_id, :profile_type)
   end

end

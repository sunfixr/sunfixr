class ProjectController < ApplicationController
  def home
    @installation = Installation.find_by_slug(params[:name].downcase)
  end
  def index
    @installations = Installation.all
  end

end

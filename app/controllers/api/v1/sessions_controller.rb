module Api
  module V1
    class SessionsController < Devise::SessionsController
      skip_before_filter :restrict_access_by_token, :only => :create
      skip_before_action :verify_authenticity_token
      respond_to :json
      FMT_JSON_USER='{"id":"%s", "email":"%s", "authentication_token":"%s"}'
      def create
        self.resource = warden.authenticate!(:scope => resource_name)
        sign_in(resource_name, resource)
        render :json => format(FMT_JSON_USER,resource.id,resource.email,resource.authentication_token), :status => 200
      end

      def destroy
        @current_user && @current_user.reset_authentication_token!
        super
      end
    end
  end
end
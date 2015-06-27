
class Devise::SunfixrRegistrationsController < Devise::RegistrationsController
  prepend_before_filter :add_to_project, only: [:new], if: proc { params[:project_id] }
  skip_before_filter :require_no_authentication, only: [:new], if: proc { params[:project_id] }

  def new
    super
  end

  def create
    # override this to allow for signing up in a particular project.
    unless params[:project_id].empty?
      project = Project.find(params[:project_id]) rescue nil
    end
    session['user_return_to'] = project_path(project.slug) if project
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      resource.users_projects << UsersProject.create(user_id: resource.id, project_id: project.id, role: 'user') if project
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      #pass along the project_id if there
      project ? respond_with(resource, project_id: project.id) : respond_with(resource)
    end
  end

  def update
    super
  end


  protected

  def add_to_project
    assert_is_devise_resource!
    return unless is_navigational_format?
    # adds a user to project if they are already logged in
    no_input = devise_mapping.no_input_strategies

    authenticated = if no_input.present?
      args = no_input.dup.push scope: resource_name
      warden.authenticate?(*args)
    else
      warden.authenticated?(resource_name)
    end

    if authenticated && resource = warden.user(resource_name)
      project = Project.find(params[:project_id])
      project.users << resource unless project.users.exists?(resource)
      flash[:notice] = "You have successfully joined the #{project.name} project"
      redirect_to project_path(project.slug)
    end
  end


end
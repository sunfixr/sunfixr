Rails.application.routes.draw do
  devise_for :user, :controllers => {:registrations => "devise/sunfixr_registrations"}

 scope :api do
   scope :v1 do

   end
 end
 namespace :api do
  namespace :v1 do
    devise_for :users, :controllers => {:registrations => "api/v1/registrations", :sessions => "api/v1/sessions"}
    resources :addresses
    resources :posts
    resources :log_entries
    resources :components
    resources :companies
    resources :projects
   end
 end


  resources :project, only: [:index, :show, :update] do
    resources :project_pics, only: [:index, :destroy, :show], controller: 'project/project_pics'
    resources :attachments, only: [:index, :destroy], controller: 'project/attachments'
    resources :users, only: [:index, :destroy, :show], controller: 'project/users'
    get '/attachments/list', to: 'project/attachments#list', as: 'attachments_list'
    post 'users/invite(.:format)', to: 'project/users#invite', as: 'invite_new_user'
  end



  root 'home#index', as: :root
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/home' => 'home#index', as: :home_index
  get 'mon' => 'mon#index', as: 'mon'

  get 'projects' => 'project#index', as: 'projects'
end

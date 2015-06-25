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

  resources :projects, only: [:index, :show, :update] do
    resources :project_pics, only: [:index, :destroy, :show]
    resources :users, only: [:index, :destroy, :show]
    post 'users/invite(.:format)', to: 'users#invite', as: 'invite_new_user'
  end



  root 'home#index', as: :root
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/home' => 'home#index', as: :home_index
  get 'training' => 'training#index', as: 'training'
  get 'manuals' => 'manuals#index', as: 'manuals'

  get 'mon' => 'mon#index', as: 'mon'
end

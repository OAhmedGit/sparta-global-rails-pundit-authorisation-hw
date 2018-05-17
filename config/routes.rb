Rails.application.routes.draw do
  resources :tweets
  resources :posts
  devise_for :users
  resources :homes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_scope :user do get "/users" => "devise/sessions#new" end
  # @request.env["devise.mapping"] = Devise.mappings[:user]
  get '/', to:'homes#index', as: 'root'
end

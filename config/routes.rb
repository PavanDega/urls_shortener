Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'urls#new'
  resources :urls, only: [:new, :create, :show]
  get '/:short_url', to: 'urls#redirect', as: :redirect
  namespace :api do
      resources :urls, only: [:create]
  end
end

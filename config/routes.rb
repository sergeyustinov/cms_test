Rails.application.routes.draw do
  devise_for :users

  namespace :cms do
    root 'search#index'
  end

  root 'search#index'
end

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :file_uploads, only: [ :index, :create, :show, :new, :destroy ]
end

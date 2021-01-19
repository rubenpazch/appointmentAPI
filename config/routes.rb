Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tokens, only: [:create]
    end
  end
  
  namespace :api, defaults: { format: :json }  do
    namespace :v1 do 
      resources :users, only: %i[show index create update destroy]
    end 
  end

  namespace :api, defaults: { format: :json }  do
    namespace :v1 do 
      resources :people, only: %i[create]
    end 
  end
end

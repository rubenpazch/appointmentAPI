Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'departments/index'
    end
  end
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

  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      resources :appointments, only: %i[index]
    end 
  end

  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      resources :departments, only: %i[index]
    end 
  end

  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      resources :getappointments, only: %i[create]
    end 
  end
end

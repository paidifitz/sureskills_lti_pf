Rails.application.routes.draw do



  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  resources :platforms do
    resources :resource_links do 
      resources :rosters, only: :index
      resources :connects, only: :index
    end
    resources :platform_keys
    resources :contexts
    resources :authorizations
  end
end

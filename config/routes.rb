Rails.application.routes.draw do



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  resources :platforms do
    resources :resource_links
    resources :platform_keys
    resources :contexts
  end
end

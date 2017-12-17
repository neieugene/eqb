Rails.application.routes.draw do
  resources :lab_queues do
    resources :clients
  end
  namespace :users do
    get 'omniauth_callbacks/vkontakte'
  end
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  devise_for :users,
    controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

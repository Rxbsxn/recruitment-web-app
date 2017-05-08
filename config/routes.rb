Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :home, only: [:index, :destroy]

  namespace :admin do
    resources :users
  end
  
  resource :mails do
    collection do
      post :send_mail
    end
  end
end

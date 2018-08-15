Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: %i[index new create show destroy] do
    resources :reviews, only: %i[index new create]
  end

  resources :reviews, only: %i[show]
end

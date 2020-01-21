Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  resources :bloggers, only: [:index, :new, :create, :show]
  resources :posts, except: [:destroy]
  resources :destinations, only: [:index, :show]
  get "posts/:id/like", to: "posts#like", as: "like_post"
end

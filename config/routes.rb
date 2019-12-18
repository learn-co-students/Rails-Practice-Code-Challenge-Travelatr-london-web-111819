Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :bloggers, only: [:index, :new, :create, :show]
resources :posts, only: [:index, :new, :create, :show, :edit, :update]
resources :destinations, only: [:index, :show]
get "posts/:id/like", to: "posts#like", as: "like_post"

end

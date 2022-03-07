Rails.application.routes.draw do
  devise_for :users
  get 'games/index'
  get 'games/show'
  get 'games/new'
  get 'games/edit'
  root to: "homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

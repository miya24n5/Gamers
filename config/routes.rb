Rails.application.routes.draw do
  get 'games/index'
  get 'games/show'
  get 'games/new'
  get 'games/edit'
  root to: "homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

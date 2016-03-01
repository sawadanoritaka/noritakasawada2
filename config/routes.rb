Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users
  resources :users,only: [:index,:show]
  resources :blogs
  root "top#fv"
  get "show/part1" => "show#part1"
  post "show/part1" => "show#part1"
  post "show/part2" => "show#part2"
  post "show/part3" => "show#part3"
end

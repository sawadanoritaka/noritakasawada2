Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  root "blogs#index"
  get "show/part1" => "show#part1"
  post "show/part1" => "show#part1"
  post "show/part2" => "show#part2"
  post "show/part3" => "show#part3"
end

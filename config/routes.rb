Rails.application.routes.draw do
  resources :questions
  resources :comments
  get 'about/company_overview'

  get 'users/index'

  get 'users/show'

  devise_for :users, controllers: {
sessions: "users/sessions",
registrations: "users/registrations",
passwords: "users/passwords",
omniauth_callbacks: "users/omniauth_callbacks"
}

  resources :users,only: [:show,:edit,:update,:index]
  resources :blogs do
    resources :comments
  end

  resources :questions do
    resources :questions_comments
  end


  root "top#fv"
  get "show/part1" => "show#part1"
  get "email" => "email#box"
  get "about" => "about#company_overview"
  post "show/part1" => "show#part1"
  post "show/part2" => "show#part2"
  post "show/part3" => "show#part3"
match "*path" => "application#handle_404", via: :all
end

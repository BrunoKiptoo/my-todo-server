Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  match '*path', via: [:options], to: lambda {|_| [200, { 'Content-Type' => 'text/plain' }, ['OK']] }


  # user
  post '/users', to: 'users#register'
  post '/users/login', to: 'users#login'
  delete '/users/logout', to: 'users#logout'
  get '/user/login/check', to: 'users#check_login_status'

  # todos
  post '/todos', to: 'todos#create'
  put '/todos/:id', to: 'todos#update'
  delete '/todos/:id', to: 'todos#destroy'
  get '/todos', to: 'todos#index'

  # verify auth
  get '/verify', to: 'application#verify_auth'

end

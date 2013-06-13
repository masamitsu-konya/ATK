Atk::Application.routes.draw do
  get "admin/index"

  get "ranking/index"

  get "scores/index"

  get "tests/index"

  get "questions/create"

  root :to => 'welcome#index'
  
  # for omniauth settings
  match '/auth/:provider/callback' => 'sessions#login'
  match '/logout' => 'sessions#logout', :as => :logout
  match '/login' => 'sessions#login_request'

  match ':controller(/:action(/:id))(.:format)'
  
  match '/welcome/profile' => 'welcome#profile'

  match '/questions/create/' => 'questions#create' 
  match '/questions/new/' => 'questions#new' 
  match '/questions/finish_create' => 'questions#finish_create'
  match '/questions/upload' => 'questions#upload'

  match '/tests/index/' => 'tests#index'
  match '/tests/test_practice/' => 'tests#test_practice'
  match '/tests/test/' => 'tests#test'
  match '/tests/test_performance/' => 'tests#test_performance'

  match '/ranking/' => 'ranking#index'

  match '/admin/' => 'admin#index'
  match '/admin/category' => 'admin#category'
  match '/admin/edit_category' => 'admin#edit_category'
  match '/admin/edit_question' => 'admin#edit_question'
  match '/admin/accept_public' => 'admin#accept_public'

  match '/author/' => 'author#index'

  match ':controller(/:action(/:id))(.:format)'

end

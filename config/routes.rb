Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'
  
  #resources :posts
  # =>this works fine but now we want posts/1/comment_id so we change resources
  
  resources :posts do
    resources :comments
  
  end

end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'article#index'
  resources :article do
  	post 'create_comment'
  	post 'article_vote'
  end
end

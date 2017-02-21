Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  get 'close', to: 'questions#close'

  resources :questions do
    resources :answers do
      member do
        put "like", to: "answers#upvote"
      end
    end
  end
end

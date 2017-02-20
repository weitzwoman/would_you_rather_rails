Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :questions do
    resources :answers do
      member do
        put "like", to: "answers#upvote"
      end
    end
  end
end

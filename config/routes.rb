Rails.application.routes.draw do
  root :to => "posts#index"

  resources :posts do
    resources :questions
  end



end

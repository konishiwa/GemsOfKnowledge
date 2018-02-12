# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :quizzes do
    get 'take'
    patch 'grade' => "quizzes#grade"
  end

  resources :questions

  devise_for :users

  root to: "quizzes#index"

end
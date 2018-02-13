# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root to: 'quizzes#index'

  resources :quizzes do
    get 'take'
    patch 'grade' => 'quizzes#grade'
  end

  # resources :questions # DO NOT make questions individually accessible via url

  devise_for :users

  # NOTES:
  # Use Rails.application.reload_routes! in paused debug console to force routes to reload

end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root to: 'quizzes#index'

  resources :quizzes do
    get 'take'
    patch 'grade' => 'quizzes#grade'
  end

  get 'about' => 'about#index'

  get 'tutorial' => 'tutorial#index'

  devise_for :users

  #if Rails.env.production?
  get '404' => 'application#page_not_found'
  #end
  match '*a' => 'application#page_not_found', via: [:get, :post]

  # NOTES:
  # Use Rails.application.reload_routes! in paused debug console to force routes to reload

end
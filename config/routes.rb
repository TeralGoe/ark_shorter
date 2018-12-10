Rails.application.routes.draw do
  root to: 'static#blank'

  # scope module: :web do
  #   resources :shorters
  # end

  namespace :api do
    resources :shorters, only: %i[index show create]
  end
end

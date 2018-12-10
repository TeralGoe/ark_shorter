Rails.application.routes.draw do
  root to: 'static#blank'

  # scope module: :web do
  #   resources :shorters
  # end

  namespace :api, defaults: { format: :json } do
    resources :shorters, only: %i[index show create], param: :code
    resources :visitors, only: :index
  end
end

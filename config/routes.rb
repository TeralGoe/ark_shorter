Rails.application.routes.draw do
  scope module: :web do
    get '/docs', to: 'static#docs'
  end

  namespace :api, defaults: { format: :json } do
    resources :shorters, only: %i[index show create], param: :code
    resources :visitors, only: :index
  end
end

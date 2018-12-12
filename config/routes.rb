Rails.application.routes.draw do
  scope module: :web do
    root to: 'shorters#new'
    get '/docs', to: 'static#docs'
    resources :shorters, only: %i[create show edit], path: '', param: :code do
      resources :visitors, only: %i[create]
    end
  end

  namespace :api, defaults: { format: :json } do
    resources :shorters, only: %i[index show create], param: :code
    resources :visitors, only: :index
  end
end

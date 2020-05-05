Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users do
        collection do
          post 'signup', to: 'users#create'
        end
      end
      resources :recipes do
        collection do
          get :popular, to: 'recipes#popular'
        end
      end
      resources :sessions, only: [:new, :create, :destroy] do
        collection do
          get 'login', to: 'sessions#create'
          get 'logout', to: 'sessions#destroy'
        end
      end
    end
  end
end

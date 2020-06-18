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
          get :autocomplete, to: 'recipes#autocomplete'
        end
      end
      resources :types do
        member do
          resources :products, only: [:index], param: :type_id
        end
      end
      resources :sessions, only: [:new, :create, :destroy] do
        collection do
          get 'login', to: 'sessions#create'
          get 'logout', to: 'sessions#destroy'
        end
      end
      resources :recognitions do
        collection do
          get 'recipes', to: 'recognitions#recipes'
          get 'recipes_by_video', to: 'recognitions#recipes_by_video'
        end
      end
      resources :recipes_api do
        collection do
          get 'ingredients', to: 'recipes_api#ingredients'
          get 'instructions', to: 'recipes_api#instructions'
        end
      end
    end
  end
end

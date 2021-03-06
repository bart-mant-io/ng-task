Rails.application.routes.draw do
  devise_for :users

  root "home#welcome"
  resources :genres, only: :index do
    member do
      get "movies"
    end
  end

  resources :movies, only: [:index, :show] do
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end

  resources :comments

  delete 'comments/:id', to: 'comments#destroy', as: 'destroy_comment'

  get 'movies_api', to: 'movies#api_index', as: 'movies_api'
  get 'movie_api/:id', to: 'movies#api_show', as: 'movie_api'

  get 'genres_api', to: 'genres#api_index', as: 'genres_api'

end

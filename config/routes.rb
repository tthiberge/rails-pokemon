Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :pokemons, only: %i[index show] do
    # get * 3 avec les diff transactions
  end






end

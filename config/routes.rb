Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"

  resources :pokemons, only: %i[index show] do
    # get * 3 avec les diff transactions
    get "/checkout", to: "transactions#checkout", as: :transaction_checkout
    post "/pokemons/:id/buy", to: "transactions#buy", as: :transaction_buy
    post "/pokemons/:id/sell", to: "transactions#sell", as: :transaction_sell
  end



  get "/me", to: "pages#profile", as: :my_profile
  get "/me/add", to: "pages#add", as: :add_money_to_balance
  patch "me/add", to: "pages#update_balance", as: :update_money_in_balance
  get "/me/transactions", to: "pages#transactions", as: :list_transactions



end

class TransactionsController < ApplicationController

  def checkout
    @pokemon = Pokemon.find(params[:pokemon_id])
  end

  # Faire appel aux params, c'est un peu comme un create
  def buy
    @user = current_user
    @pokemon = Pokemon.find(params[:pokemon_id])

    if @user.balance < @pokemon.price
      render pokemon_path(@pokemon), alert: "Sorry, not enough money in your balance"
    else
      @transaction = Transaction.new(transaction_params)
      @seller = @pokemon.user
      @user.balance = @user.balance - @pokemon.price
      @pokemon.user = @user
      @transaction.action = "buy from #{@seller} for #{@pokemon.price} USD_BTC"
    end
    @pokemon.save
    @user.save
    @seller.save
    if @transaction.save
      redirect_to list_transactions_path
    else
      render pokemon_path(@pokemon), status: :unprocessable_entity
    end
  end

  # Je ne sais pas trop quoi mettre dans SELL. L'appeler depuis buy car les deux sont concommitants?
  def sell
  end

  private
  def transaction_params
    params.require(:transaction).permit(:action, :user, :pokemon)
  end
end

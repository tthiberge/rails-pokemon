class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = current_user
  end

  def add
    @user = current_user
  end

  def update_balance
    @user = current_user
    @user.balance = params[:add_money_to_balance][:balance].to_i

    if @user.save
      redirect_to my_profile_path, notice: 'Money has been successfully added to your balance'
    else
      render :add, status: :unprocessable_entity
    end
  end

  def transactions
    @user = current_user
    @transactions = @user.transactions
  end

  private
  # Surement mettre les params pour la patch
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    user_accounts = Account.where(user_id: current_user.id)
    user_savings = Saving.where(user_id: current_user.id)
    @accounts = user_accounts.where.not(account_type: "Savings")
    @accounts_money = 0

    @accounts.each do |account|
      account.updateBalance
      @accounts_money += account.balance
    end

    @savings = user_savings.all


    if @savings.length > 0
      @saving_account = @savings.sample
      @saving_account.updateBalance
      @saving_balance = @saving_account.balance
      @saving_goal = @saving_account.saving_goal
      @saving_gap = @saving_goal - @saving_balance

      @saving_chart = {"savings" => @saving_balance, "lack" => @saving_gap}
    end
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @accounts = Account.where.not(account_type: "Savings")
    @accounts_money = 0

    @accounts.each do |account|
      @accounts_money += account.balance
    end

    @saving_account = Account.where(account_type: "Savings").sample
    @saving_balance = @saving_account.balance
    @saving_goal = @saving_account.saving_goal
    @saving_gap = @saving_goal - @saving_balance

    @saving_chart = {"savings" => @saving_balance, "lack" => @saving_gap}
  end
end

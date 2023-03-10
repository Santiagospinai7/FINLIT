class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
    @selected_option = params[:query]
    # user_account = current_user.id
    user_accounts = Account.where(user_id: current_user.id)

    if @selected_option == "Accounts"
      @text_option_1 = "Accounts"
      @text_option_2 = "Savings"
    elsif @selected_option == "Savings"
      @text_option_1 = "Savings"
      @text_option_2 = "Accounts"
    else
      @text_option_1 = "Accounts"
      @text_option_2 = "Savings"
    end

    @selected_option = "Accounts" if @selected_option == nil

    if params[:query] == "Accounts"
      # Handle filter option 1
      # @selected_option = params[:query]
      @filter_option_1 = "Accounts"
      @filter_option_2 = "Savings"
      @accounts = user_accounts.where.not(account_type: "Savings")
    elsif params[:query] == "Savings"
      # Handle filter option 2
      # @selected_option = params[:query]
      @filter_option_1 = "Savings"
      @filter_option_2 = "Accounts"
      @accounts = user_accounts.where(account_type: "Savings")

      # if @accounts.length > 0

      #   @saving_balance = @ccoun.balance
      #   @saving_goal = @saving_account.saving_goal
      #   @saving_gap = @saving_goal - @saving_balance
  
      #   @saving_chart = {"savings" => @saving_balance, "lack" => @saving_gap}
      # end

    else
      # Handle no filter selected
      @filter_option_1 = "Accounts"
      @filter_option_2 = "Savings"
      @accounts = user_accounts.where.not(account_type: "Savings")
    end

  end

  # GET /accounts/1 or /accounts/1.json
  def show
    if current_user.id == @account.user_id
      @transactions = @account.transactions
    end
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @account_type = ["Current account", "Saving", "Other"]
  end

  # GET /accounts/1/edit
  def edit
    # @account = Account.find(params[:id])
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    @account.save

    redirect_to accounts_path
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    # account = Account.find(params[:id])
    if current_user.id == @account.user_id
      @account.update(account_params)

      redirect_to accounts_path
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    if current_user.id == @account.user_id
      @account.destroy
    end

    redirect_to accounts_path, status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:account_name, :account_type, :balance, :user_id, :account_number, :saving_goal)
    end
end

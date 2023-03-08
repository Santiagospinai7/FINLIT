class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
  
    @selected_option = params[:query]

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
      @accounts = Account.where.not(account_type: "Savings")
    elsif params[:query] == "Savings"
      # Handle filter option 2
      # @selected_option = params[:query]
      @filter_option_1 = "Savings"
      @filter_option_2 = "Accounts"
      @accounts = Account.where(account_type: "Savings")
    else
      # Handle no filter selected
      @filter_option_1 = "Accounts"
      @filter_option_2 = "Savings"
      @accounts = Account.where.not(account_type: "Savings")
    end
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    @transactions = @account.transactions
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @account_type = ["Current account", "Saving", "Other"]
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
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
    account = Account.find(params[:id])
    account.update(account_params)

    redirect_to accounts_path
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy
  
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

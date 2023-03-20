class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]
  before_action :set_balance, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
    @selected_option = params[:query]
    # user_account = current_user.id
    @selected_option = "Accounts" if @selected_option == nil

    user_accounts = Account.where(user_id: current_user.id)
    @accounts = user_accounts.all

    if params[:query] == "Accounts"
      @accounts = user_accounts.all
      redirect_to controller: :accounts, action: :index 
    elsif params[:query] == "Savings"
      redirect_to controller: :savings, action: :index  
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
    # raise
    @account = Account.new(account_params)
    icon_id = params[:account][:icon_id]
    icon = icon_id.blank? ? (Icon.all).sample : Icon.find(icon_id)
    @account.icon_id = icon.id
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
      params.require(:account).permit(:account_name, :account_type, :balance, :user_id, :account_number, :icon_id)
    end

    def set_balance
      @account = Account.find(params[:id])
      @account.updateBalance
    end
end

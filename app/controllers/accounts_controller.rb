class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
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
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:account_name, :account_type, :balance, :user_id, :account_number)
    end
end

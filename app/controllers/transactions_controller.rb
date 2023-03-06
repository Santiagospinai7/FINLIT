class TransactionsController < ApplicationController
  CATEGORIES = ['Groceries', 'Transportation', 'Entertainment', 'Utilities', 'Other']
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    account = Account.find(params[:account_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.account_id = account.id
    @transaction.save

    #update account balance
    account.balance += @transaction.amount
    account.save

    redirect_to account_path(account.id)
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:category, :amount, :date)
    end
end

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
    if params[:account_id].blank?
      @account = Saving.find(params[:saving_id])
    else 
      @account = Account.find(params[:account_id])
    end
    @transaction = @account.transactions.new
  end

  # GET /transactions/1/edit
  def edit
    @account = Account.find(params[:account_id])
  end

  # POST /transactions or /transactions.json
  def create
    
    if params[:account_id].nil?
      account = Saving.find(params[:saving_id])
      @transaction = Transaction.new(transaction_params_saving)
      @transaction.saving = account
    else
      account = Account.find(params[:account_id])
      @transaction = Transaction.new(transaction_params_account)
      @transaction.account = account
    end
    
    @transaction.save

    #update account balance
    account.balance += @transaction.amount
    account.save

    redirect_to account_path(account.id)
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    @transaction.update(transaction_params)
    @account = Account.find(params[:account_id])

    redirect_to account_path(@account)
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @account = Account.find(params[:account_id])
    @transaction.destroy
  
    redirect_to account_path(@account), status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params_account
      params.require(:transaction).permit(:operation_type, :category, :amount, :date)
    end

    def transaction_params_saving
      params.require(:transaction).permit(:operation_type, :amount, :date)
    end
end

class TransactionsController < ApplicationController
  CATEGORIES = ['Groceries', 'Transportation', 'Entertainment', 'Utilities', 'Other']
  before_action :set_transaction, only: %i[ show edit update destroy ]
  before_action :set_type_account, only: %i[ new edit create update destroy ]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = @account.transactions.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    
    if params[:account_id].nil?
      @transaction = Transaction.new(transaction_params_saving)
      @transaction.saving = @account
    else
      @transaction = Transaction.new(transaction_params_account)
      @transaction.account = @account
    end
    
    @transaction.save

    redirect_to account_path(@account.id)
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    @transaction.update(transaction_params_account)

    if @account.class == Saving
      # @account = Saving.find(params[:account_id])
      redirect_to saving_path(@account)
    else
      # @account = Account.find(params[:account_id])
      redirect_to account_path(@account)
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy
  
    if @account.class == Saving
      # @account = Saving.find(params[:account_id])
      redirect_to saving_path(@account), status: :see_other
    else
      # @account = Account.find(params[:account_id])
      redirect_to account_path(@account), status: :see_other
    end
    
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

    def set_type_account
      if params[:account_id].nil?
        @account = Saving.find(params[:saving_id])
      else
        @account = Account.find(params[:account_id])
      end
    end
end

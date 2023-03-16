class SavingsController < ApplicationController
  before_action :set_saving, only: %i[ show edit update destroy ]
  before_action :set_balance, only: %i[ show edit update destroy ]

  def index
    @savings = Saving.where(user_id: current_user.id)

    @savings.each do |saving|
      saving.updateBalance
    end
  end

  def show
    if current_user.id == @saving.user_id
      @transactions = @saving.transactions
      
      @achive = (@saving.balance >= @saving.saving_goal)
    end
  end

  def new
    @saving = Saving.new
    # @account_type = ["Current account", "Saving", "Other"]
  end

  def edit
  end

  def create
    @saving = Saving.new(saving_params)
    icon_id = params[:saving][:icon_id]
    icon = icon_id.blank? ? (Icon.all).sample : Icon.find(icon_id)
    @saving.icon_id = icon.id
    @saving.user_id = current_user.id
   if @saving.save
    redirect_to savings_path
   else
    render :new, status: :unprocessable_entity
   end 
  end

  def update
    if current_user.id == @saving.user_id
      @saving.update(saving_params)

      redirect_to savings_path
    end
  end

  def destroy
    if current_user.id == @saving.user_id
      @saving.destroy
    end

    redirect_to savings_path, status: :see_other
  end

  private

  def set_saving
    @saving = Saving.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def saving_params
    params.require(:saving).permit(:saving_name, :saving_goal, :balance, :user_id, :time_goal, :icon_id)
  end

  def set_balance
    @saving = Saving.find(params[:id])
    @saving.updateBalance
  end
end

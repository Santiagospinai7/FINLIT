class SavingsController < ApplicationController
  before_action :set_saving, only: %i[ show edit update destroy ]

  # GET /savings or /savings.json
  def index
    @savings = Saving.all
  end

  # GET /savings/1 or /savings/1.json
  def show
  end

  # GET /savings/new
  def new
    @saving = Saving.new
  end

  # GET /savings/1/edit
  def edit
  end

  # POST /savings or /savings.json
  def create
    @saving = Saving.new(saving_params)
  end

  # PATCH/PUT /savings/1 or /savings/1.json
  def update
  end

  # DELETE /savings/1 or /savings/1.json
  def destroy
    @saving.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saving
      @saving = Saving.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def saving_params
      params.require(:saving).permit(:saving_name, :saving_goal, :current_balance, :user_id)
    end
end

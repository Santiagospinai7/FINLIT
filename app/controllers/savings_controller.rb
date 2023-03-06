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

    respond_to do |format|
      if @saving.save
        format.html { redirect_to saving_url(@saving), notice: "Saving was successfully created." }
        format.json { render :show, status: :created, location: @saving }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /savings/1 or /savings/1.json
  def update
    respond_to do |format|
      if @saving.update(saving_params)
        format.html { redirect_to saving_url(@saving), notice: "Saving was successfully updated." }
        format.json { render :show, status: :ok, location: @saving }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /savings/1 or /savings/1.json
  def destroy
    @saving.destroy

    respond_to do |format|
      format.html { redirect_to savings_url, notice: "Saving was successfully destroyed." }
      format.json { head :no_content }
    end
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

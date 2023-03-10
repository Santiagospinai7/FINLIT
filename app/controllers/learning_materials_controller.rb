class LearningMaterialsController < ApplicationController

  def index
    @learning_materials = Learning_materials.all
  end

  def show
    @learning_materials = Learning_materials.find(params[:id])
  end

  def new
    @learning_materials = Learning_materials.new
  end

  def create
    @learning_materials = Learning_materials.new(learning_materials_params)
    if @learning_materials.save
      redirect_to learning_materials_path(@learning_materials)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @learning_materials = Learning_materials.find(params[:id])
  end

  def updated
    learning_materials = Learning_materials.find(params[:id])
    learning_materials.update(learning_materials_params)

    redirect_to learning_materials_path

  end

  def destroy
    learning_materials = Learning_materials.find(params[:id])
    learning_materials.destroy
  end


  private

  def learning_materials_params
    params.require(:Learning_materials).permit(:matrial_type, :title, :description, :url, :favorite)
  end
end

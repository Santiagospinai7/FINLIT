class LearningMaterialsController < ApplicationController

  def index
    @learning_materials = LearningMaterial.all
  end

  def show
    @learning_material = LearningMaterial.find(params[:id])
  end

  def new
    @learning_materials = LearningMaterial.new
  end

  def create
    @learning_materials = LearningMaterial.new(learning_materials_params)
    if @learning_materials.save
      redirect_to learning_materials_path(@learning_materials)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @learning_materials = LearningMaterial.find(params[:id])
  end

  def update
    learning_materials = LearningMaterial.find(params[:id])
    learning_materials.update(learning_materials_params)

    redirect_to learning_materials_path

  end

  def destroy
    learning_materials = LearningMaterial.find(params[:id])
    learning_materials.destroy
  end


  private

  def learning_materials_params
    params.require(:Learning_materials).permit(:matrial_type, :title, :description, :url, :favorite)
  end
end

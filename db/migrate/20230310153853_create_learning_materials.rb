class CreateLearningMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_materials do |t|
      t.string :material_type
      t.string :title
      t.text :description
      t.string :explanation
      t.string :favorite

      t.timestamps
    end
  end
end

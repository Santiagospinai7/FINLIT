class CreateSavedLearningMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_learning_materials do |t|
      t.references :user, null: false, foreign_key: true
      t.references :learning_material, null: false, foreign_key: true

      t.timestamps
    end
  end
end

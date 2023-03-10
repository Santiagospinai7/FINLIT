class CreateLearningMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_materials do |t|
      t.string :material_type
      t.string :title
      t.text :description
      t.string :url
      t.references :quiz, null: false, foreign_key: true
      t.string :favorite
      t.references :topic_material, null: false, foreign_key: true

      t.timestamps
    end
  end
end

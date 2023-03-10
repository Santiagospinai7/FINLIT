class AddDetailsToLearningMaterial < ActiveRecord::Migration[7.0]
  def change
    add_reference :learning_materials, :topic_material, null: false, foreign_key: true
  end
end

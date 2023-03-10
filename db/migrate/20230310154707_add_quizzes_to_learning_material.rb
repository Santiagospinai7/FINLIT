class AddQuizzesToLearningMaterial < ActiveRecord::Migration[7.0]
  def change
    add_reference :learning_materials, :quiz, null: false, foreign_key: true
  end
end

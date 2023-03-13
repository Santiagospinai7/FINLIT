class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.decimal :score
      t.references :learning_material, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSavings < ActiveRecord::Migration[7.0]
  def change
    create_table :savings do |t|
      t.string :saving_name
      t.decimal :saving_goal
      t.decimal :current_balance

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

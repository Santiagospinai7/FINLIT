class CreateSavings < ActiveRecord::Migration[7.0]
  def change
    create_table :savings do |t|
      t.references :user, null: false, foreign_key: true
      t.date :time_goal
      t.decimal :balance
      t.decimal :saving_goal
      t.string :saving_name

      t.timestamps
    end
  end
end

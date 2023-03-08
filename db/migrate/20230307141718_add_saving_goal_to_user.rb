class AddSavingGoalToUser < ActiveRecord::Migration[7.0]
  def change
    drop_table :savings, if_exists: true
    add_column :accounts, :saving_goal, :decimal
  end
end

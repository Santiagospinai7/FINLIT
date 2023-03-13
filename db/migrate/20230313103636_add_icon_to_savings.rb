class AddIconToSavings < ActiveRecord::Migration[7.0]
  def change
    add_reference :savings, :icon, null: false, foreign_key: true
  end
end

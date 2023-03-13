class AddIconToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :icon, null: false, foreign_key: true
  end
end

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.string :account_type
      t.decimal :balance

      t.references :user, null: false, foreign_key: true
      t.integer :account_number

      t.timestamps
    end
  end
end

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :category
      t.integer :amount
      t.date :date
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end

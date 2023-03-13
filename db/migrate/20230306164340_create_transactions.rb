class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :category
      t.decimal :amount
      t.date :date
      t.references :account, optional: true, foreign_key: true

      t.timestamps
    end
  end
end

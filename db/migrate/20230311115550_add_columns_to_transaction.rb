class AddColumnsToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :operation_type, :string
    add_reference :transactions, :saving, optional: true, foreign_key: true
  end
end

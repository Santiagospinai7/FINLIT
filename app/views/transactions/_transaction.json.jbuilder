json.extract! transaction, :id, :category, :amount, :date, :account_id_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)

json.extract! account, :id, :account_name, :account_type, :balance, :user_id, :account_number, :created_at, :updated_at
json.url account_url(account, format: :json)

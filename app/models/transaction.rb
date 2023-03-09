class Transaction < ApplicationRecord
  belongs_to :account

  def self.line_chart(account)
    transactions = account.transactions
    transactions_by_date = transactions.group(:date).sum(:amount)

    formatted_transactions_by_date = transactions_by_date.map do |date, amount|
      [date.strftime("%Y-%m-%d"), amount]
    end.to_h

    return formatted_transactions_by_date
  end
end

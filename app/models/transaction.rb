class Transaction < ApplicationRecord
  belongs_to :account, optional: true
  belongs_to :saving, optional: true

  validates :operation_type, presence: true
  # validates :date, presence: true
  # validates :amount, presence: true, numericality: { other_than: 0 }
  validates :amount, presence: true
  validate :account_or_saving_present

  validate :validate_savings_goal

  # validates :category, presence: true, if: :account_present

  def self.line_chart(account)
    transactions = account.transactions
    transactions_by_date = transactions.group(:date).sum(:amount)

    formatted_transactions_by_date = transactions_by_date.map do |date, amount|
      [date.strftime("%Y-%m-%d"), amount]
    end.to_h

    transactions_by_balance = transactions_by_date

    transactions_by_balance.transform_values!  {| val| val = account.balance.to_i + val.to_i}
    return transactions_by_balance
    return formatted_transactions_by_date
  end

  private

  def account_or_saving_present
    if account_id.blank? && saving_id.blank?
      errors.add(:base, "Either account or savings must be present")
    elsif account_id.present? && saving_id.present?
      errors.add(:base, "Cannot assign transaction to both account and savings")
    end
  end

  def validate_savings_goal
    # Retrieve current savings balance and savings goal from Savings model
    if saving_id.present?
      transactions = Saving.find(saving_id).transactions
      savings_balance = Saving.find(saving_id).balance
      transactions.map {  |transaction| savings_balance += transaction.amount  }
      savings_goal = Saving.find(saving_id).saving_goal

      # Retrieve new transaction amount
      transaction_amount = amount

      # Calculate total savings balance after adding new transaction amount
      total_savings_balance = savings_balance + transaction_amount

      # Compare total savings balance with savings goal
      if total_savings_balance > savings_goal
        # Add error message to errors object
        errors.add(:amount, "exceeds savings goal")
      end
    end
  end
end

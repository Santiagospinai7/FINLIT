class Transaction < ApplicationRecord
  belongs_to :account, optional: true
  belongs_to :saving, optional: true

  validates :operation_type, presence: true
  # validates :date, presence: true
  # validates :amount, presence: true, numericality: { other_than: 0 }
  validates :amount, presence: true
  validate :account_or_saving_present

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

  def self.categories
    return ['Food & Drinks', 'Income', 'Investments', 'Shopping' , 'Housing', 'Transportation', 'Vehicle', 'Life & Entertainment', 'Financial expenses']
  end

  private

  def account_or_saving_present
    if account_id.blank? && saving_id.blank?
      errors.add(:base, "Either account or savings must be present")
    elsif account_id.present? && saving_id.present?
      errors.add(:base, "Cannot assign transaction to both account and savings")
    end
  end

  # def account_present
  #   if !(account_id.blank?)
  #     errors.add(:base, "Transaction should have a category")
  #   end
  # end
end

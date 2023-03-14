class Saving < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  belongs_to :icon

  # validates :balance, numericality: { greater_than_or_equal_to: 0 }
  validates :balance, presence: true

  def self.saving_chart(account)
    balance = account.balance
    goal = account.saving_goal
    gap = goal - balance

    return {"savings" => balance, "lack" => gap}
  end

  def self.get_porcentage(account)
    return ((account.balance / account.saving_goal) * 100).round(2)
  end

  def updateBalance
    transactions = self.transactions
    transactions.each do |transaction|
      self.balance += transaction.amount
    end
  end
end

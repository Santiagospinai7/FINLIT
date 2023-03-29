class Account < ApplicationRecord
  belongs_to :user
  belongs_to :icon
  has_many :transactions, dependent: :destroy

  # validates :balance, numericality: { greater_than_or_equal_to: 0 }
  validates :balance, presence: true

  def updateBalance
    transactions = self.transactions
    transactions.each do |transaction|
      self.balance += transaction.amount
    end
  end
end

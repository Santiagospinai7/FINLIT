class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  has_many :icons

  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  def self.account_types
    ["Current", "Saving", "Other"]
  end

  def updateBalance
    transactions = self.transactions
    transactions.each do |transaction|
      self.balance += transaction.amount
    end
  end

end

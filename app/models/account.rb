class Account < ApplicationRecord
  belongs_to :user
  belongs_to :icon
  has_many :transactions, dependent: :destroy

  # validates :balance, numericality: { greater_than_or_equal_to: 0 }
  validates :balance, presence: true

  after_initialize :init

  def init         #will set the default value only if it's nil
    self.icon_id ||= Icon.where(url: "wallet_icon") #let's you set a default association
  end

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

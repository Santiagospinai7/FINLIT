class Account < ApplicationRecord
  belongs_to :user
  belongs_to :icon
  has_many :transactions, dependent: :destroy

  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  after_initialize :init

  def init         #will set the default value only if it's nil
    self.icon_id ||= Icon.where(url: "wallet_icon") #let's you set a default association
  end

  def self.account_types
    ["Current", "Saving", "Other"]
  end

  def self.line_chart(account)
    accounts = account.balance
    account_by_date = account.group(:date).sum(:amount)

    formatted__by_date = account_by_date.map do |date, amount|
      [date.strftime("%Y-%m-%d"), amount]
    end.to_h

    return formatted_ac_by_date
  end

  def updateBalance
    transactions = self.transactions
    transactions.each do |transaction|
      self.balance += transaction.amount
    end
  end

end

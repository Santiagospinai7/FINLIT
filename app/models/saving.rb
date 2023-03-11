class Saving < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  def self.saving_chart(account)
    balance = account.balance
    goal = account.saving_goal
    gap = goal - balance

    return {"savings" => balance, "lack" => gap}
  end

  def self.get_porcentage(account)
    return ((account.balance / account.saving_goal) * 100).round(2)
  end
end

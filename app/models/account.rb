class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  # validates :saving_goal, presence: true, if: :saving_goal_validation_check

  # def saving_goal_validation_check
  #   account_type == "savings" || require_validation
  # end

  def self.account_types
    ["Current", "Saving", "Other"]
  end

  def self.saving_chart(account)
    balance = account.balance
    goal = account.saving_goal
    gap = goal - balance

    return {"savings" => balance, "lack" => gap}
  end

end

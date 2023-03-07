class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :saving_goal, presence: true, if: :saving_goal_validation_check

  def saving_goal_validation_check
    account_type == "savings" || require_validation
  end

  def self.account_types
    ["Current", "Saving", "Other"]
  end
end

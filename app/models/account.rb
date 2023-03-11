class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  def self.account_types
    ["Current", "Saving", "Other"]
  end

end

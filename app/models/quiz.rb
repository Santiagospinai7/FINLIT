class Quiz < ApplicationRecord
  has_many :questions
  belongs_to :learning_material
end

class LearningMaterial < ApplicationRecord
  belongs_to :quiz
  belongs_to :topic_material
  has_many :saved_learning_materials
end

class LearningMaterial < ApplicationRecord
  # has_many :saved_learning_materials
  has_many :quizzes
  belongs_to :topic_material
end

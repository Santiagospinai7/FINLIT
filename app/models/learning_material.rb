class LearningMaterial < ApplicationRecord
  belongs_to :topic_material
  has_many :saved_learning_materials
  has_many :quizzes
end

class LearningMaterial < ApplicationRecord
  belongs_to :quiz
  belongs_to :topic_material
end

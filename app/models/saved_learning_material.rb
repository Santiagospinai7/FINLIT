class SavedLearningMaterial < ApplicationRecord
  belongs_to :user_id
  belongs_to :material_id
end

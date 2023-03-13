class User < ApplicationRecord
  has_many :accounts
  has_many :savings
  has_many :saved_learning_materials
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

class Group < ApplicationRecord
  has_many :student_groups, dependent: :destroy
  has_many :students, through: :student_groups

  validates :name, presence: true, uniqueness: true
end

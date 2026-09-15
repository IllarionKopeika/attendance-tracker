class Student < ApplicationRecord
  has_many :student_groups, dependent: :destroy
  has_many :groups, through: :student_groups

  enum :sex, { male: 0, female: 1 }

  validates :name, :sex, presence: true
  validates :groups, presence: true
end

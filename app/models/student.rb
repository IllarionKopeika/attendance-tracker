class Student < ApplicationRecord
  has_many :student_groups, dependent: :destroy
  has_many :groups, through: :student_groups
end

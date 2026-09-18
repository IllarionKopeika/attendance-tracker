class Lesson < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :students, through: :attendances

  belongs_to :course
end

class Lesson < ApplicationRecord
  belongs_to :group
  belongs_to :course

  has_many :attendances, dependent: :destroy
  has_many :students, through: :attendances
end

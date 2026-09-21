class Lesson < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :students, through: :attendances

  belongs_to :course

  enum :teaching_method, { foreign_teacher: 0, chinese_teacher: 1 }

  validates :teaching_method, :given_at, presence: true, on: :update
end

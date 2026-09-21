class Lesson < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :students, through: :attendances

  belongs_to :course

  accepts_nested_attributes_for :attendances

  enum :teaching_method, { foreign_teacher: 0, chinese_teacher: 1 }

  validates :teaching_method, :given_at, presence: true, on: :update

  def attendance_ratio
    total = attendances.size
    return "" if total.zero?

    attended = attendances.count(&:attended?)
    "#{attended}/#{total}"
  end
end

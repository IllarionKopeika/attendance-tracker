class Student < ApplicationRecord
  has_many :student_groups, dependent: :destroy
  has_many :groups, through: :student_groups

  has_many :attendances, dependent: :destroy
  has_many :lessons, through: :attendances

  validates :name, :groups, presence: true
  validates :paid_lessons, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "groups", "student_groups" ]
  end
end

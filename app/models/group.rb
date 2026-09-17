class Group < ApplicationRecord
  has_many :student_groups, dependent: :destroy
  has_many :students, through: :student_groups

  has_many :lessons

  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    [ "name" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "students", "student_groups" ]
  end
end

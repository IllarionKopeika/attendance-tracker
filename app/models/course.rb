class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy
  belongs_to :group

  attr_accessor :lessons_count

  validates :name, presence: true
  validates :lessons_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
end

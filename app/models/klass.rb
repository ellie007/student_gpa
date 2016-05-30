class Klass < ActiveRecord::Base

  has_many :student_classes
  has_many :students, through: :student_classes

  validates :name, uniqueness: true

end

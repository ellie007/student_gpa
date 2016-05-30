class Student < ActiveRecord::Base

  has_many :student_classes
  has_many :klasses, through: :student_classes
  accepts_nested_attributes_for :student_classes

  validates :email, uniqueness: true

end

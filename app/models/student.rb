class Student < ActiveRecord::Base

  has_many :student_classes
  has_many :klasses, through: :student_classes
  accepts_nested_attributes_for :student_classes

  validates :email, uniqueness: true

  def average_gpa
    gpa = 0.0
    self.student_classes.each do |klass|
      gpa += klass.grade
    end
    (gpa / self.student_classes.count).round(1)
  end

end

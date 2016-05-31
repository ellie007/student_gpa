class Student < ActiveRecord::Base

  has_many :student_classes
  has_many :klasses, through: :student_classes
  accepts_nested_attributes_for :student_classes #is this necessary?

  validates :email, uniqueness: true

  def average_gpa
    gpa = 0.0
    self.student_classes.each do |klass|
      gpa += klass.grade
    end
    (gpa / self.student_classes.count).round(1)
  end

  def grade_for_klass(klass)
    self.student_classes.find_by_klass_id(klass.id).grade
  end

end

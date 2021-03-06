class Student < ActiveRecord::Base

  has_many :student_classes
  has_many :klasses, through: :student_classes

  validates :email, uniqueness: true

  def average_gpa
    gpa = 0.0
    self.student_classes.each do |klass|
      gpa += klass.grade
    end
    (gpa/self.student_classes.count).round(1)
  end

  def grade_for_klass(klass)
    self.student_classes.find_by_klass_id(klass.id).grade
  end

  def self.search(searched_field)
    db_operator = Rails.env.production? ? "ILIKE" : "LIKE"

    if !(searched_field[:first_name].empty?) && !(searched_field[:last_name].empty?)
      where("first #{db_operator} ? and last #{db_operator} ?", "%#{searched_field[:first_name]}%", "%#{searched_field[:last_name]}%")
    elsif !(searched_field[:first_name].empty?)
      where("first #{db_operator} ?", "%#{searched_field[:first_name]}%")
    else
      where("last #{db_operator} ?", "%#{searched_field[:last_name]}%")
    end
  end

end


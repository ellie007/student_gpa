# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

json = ActiveSupport::JSON.decode(File.read('db/students_classes.json'))

json["classes"].each do |k|
  Klass.create!(class_identifier: k[0].to_i, name: k[1])
end

json["students"].each do |s|
  student = Student.create!(
    first: s["first"],
    last: s["last"],
    email: s["email"])
  s["studentClasses"].each do |sc|
    student.student_classes.create!(
      klass_id: Klass.find_by_class_identifier(sc["id"]).id,
      grade: sc["grade"])
  end
end



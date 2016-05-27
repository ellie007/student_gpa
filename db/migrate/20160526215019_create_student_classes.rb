class CreateStudentClasses < ActiveRecord::Migration
  def change
    create_table :student_classes do |t|
      t.integer :student_id
      t.integer :class_id
      t.float :grade

      t.timestamps
    end
  end
end

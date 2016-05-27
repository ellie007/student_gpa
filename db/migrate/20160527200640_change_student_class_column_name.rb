class ChangeStudentClassColumnName < ActiveRecord::Migration
  def change
    rename_column :student_classes, :class_id, :klass_id
  end
end

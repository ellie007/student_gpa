class ChangeKlassColumnName < ActiveRecord::Migration
  def change
    rename_column :klasses, :klass_id, :class_identifier
  end
end

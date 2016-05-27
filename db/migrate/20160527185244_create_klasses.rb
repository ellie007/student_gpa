class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.integer :klass_id
      t.string :name

      t.timestamps
    end
  end
end

class CreateLands < ActiveRecord::Migration[6.1]
  def change
    create_table :lands do |t|
      t.string :land
      t.string :deutsch_name
      t.string :richtung

      t.timestamps
    end
  end
end

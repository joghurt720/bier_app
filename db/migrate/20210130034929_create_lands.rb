class CreateLands < ActiveRecord::Migration[6.1]
  def change
    create_table :lands do |t|
      t.string :land, null: false
      t.string :deutsch_name, null: false
      t.string :richtung, null: false

      t.timestamps
    end
  end
end

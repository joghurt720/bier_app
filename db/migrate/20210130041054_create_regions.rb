class CreateRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.string :name, null: false
      t.string :deutsch_name, null: false
      t.string :region, null: false
      t.integer :land_id, null: false

      t.timestamps
    end
  end
end

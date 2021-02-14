class CreateRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.string :deutsch_name
      t.string :region
      t.integer :land_id

      t.timestamps
    end
  end
end

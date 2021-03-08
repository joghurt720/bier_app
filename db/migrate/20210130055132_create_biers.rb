class CreateBiers < ActiveRecord::Migration[6.1]
  def change
    create_table :biers do |t|
      
      t.string :deutsch_name, null: false
      t.string :name, null: false
      t.string :prozent, null: false
      t.string :style, null: false
      t.string :explanation, null: false
      t.integer :region_id, null: false
      t.string :area, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end

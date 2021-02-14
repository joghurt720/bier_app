class CreateBiers < ActiveRecord::Migration[6.1]
  def change
    create_table :biers do |t|
      t.string :deutsch_name
      t.string :name
      t.integer :prozent
      t.string :style
      t.string :explanation
      t.integer :region_id
      t.string :area

      t.timestamps
    end
  end
end

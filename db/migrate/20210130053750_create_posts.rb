class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :user_id
      t.integer :bier_id
      t.text :content
      t.integer :valuation

    end
  end
end

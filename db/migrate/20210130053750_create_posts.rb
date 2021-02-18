class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :bier_id, null: false
      t.text :content, null: false
      t.float :evaluation, null: false

    end
  end
end

class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :service_id
      t.integer :user_id
      t.string :title
      t.string :description
      t.float :min_price
      t.float :max_price

      t.timestamps
    end
  end
end

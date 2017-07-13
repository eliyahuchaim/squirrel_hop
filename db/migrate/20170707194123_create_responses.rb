class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.integer :post_id
      t.integer :vendor_id
      t.string :title
      t.string :description
      t.float :price_quote
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end

class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :response_id
      t.string :description
      t.integer :score

      t.timestamps
    end
  end
end

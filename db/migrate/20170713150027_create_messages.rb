class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :response_id
      t.string :comment
      t.boolean :user, default:true
      t.timestamps
    end
  end
end

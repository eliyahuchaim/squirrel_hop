class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.boolean :login, default: true

      t.timestamps
    end
  end
end

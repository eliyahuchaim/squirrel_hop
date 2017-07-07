class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string :username
      t.string :password
      t.string :company_name
      t.string :phone
      t.string :email
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :street_address

      t.timestamps
    end
  end
end

class CreateVendorServices < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_services do |t|
      t.integer :vendor_id
      t.integer :service_id

      t.timestamps
    end
  end
end

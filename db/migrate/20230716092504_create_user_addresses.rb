class CreateUserAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :door_no
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :district
      t.string :state
      t.string :country
      t.string :pincode

      t.timestamps
    end
  end
end

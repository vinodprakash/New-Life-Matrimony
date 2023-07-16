class CreateUserOccupations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_occupations do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :occupied
      t.string :occupation_type
      t.string :company_name
      t.string :designation
      t.string :salary

      t.timestamps
    end
  end
end

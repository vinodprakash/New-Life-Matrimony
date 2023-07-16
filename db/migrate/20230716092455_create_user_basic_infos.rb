class CreateUserBasicInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_basic_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :father_name
      t.string :mother_name
      t.integer :age
      t.integer :gender
      t.string :religion
      t.string :caste
      t.string :sub_caste

      t.timestamps
    end
  end
end

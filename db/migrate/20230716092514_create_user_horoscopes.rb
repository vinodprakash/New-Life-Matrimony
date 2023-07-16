class CreateUserHoroscopes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_horoscopes do |t|
      t.references :user, null: false, foreign_key: true
      t.date :dob
      t.datetime :time_of_birth
      t.string :place_of_birth
      t.string :zodiac
      t.string :star

      t.timestamps
    end
  end
end

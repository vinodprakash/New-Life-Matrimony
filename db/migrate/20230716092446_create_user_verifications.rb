class CreateUserVerifications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_verifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :email_otp
      t.datetime :expiry_time
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end

class CreateOtpsetups < ActiveRecord::Migration[7.1]
  def change
    create_table :otpsetups do |t|
      t.boolean :verified
      t.string :tmp_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

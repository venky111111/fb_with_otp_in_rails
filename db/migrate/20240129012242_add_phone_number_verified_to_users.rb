class AddPhoneNumberVerifiedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :phone_number_verified, :boolean
  end
end

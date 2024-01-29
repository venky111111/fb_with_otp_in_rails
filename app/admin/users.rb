ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phonenumber, :gender, :phone_number_verified, :otpsetup
   filter :name
  filter :email
  filter :phone_number_verified

  form do |f|
    f.inputs 'User Details' do
      f.input :name
      f.input :email
      f.input :gender 
      f.input :phonenumber
      f.input :password
      f.input :password_confirmation
      f.input :phone_number_verified
    end
    f.actions
  end

  
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phonenumber, :gender]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

class OtpController < ApplicationController
  before_action :authenticate_user! 

 def index
    end
  def new
  end
  def create 
    user = current_user
      
     otp = Otpsetup.find_by(user_id: user.id)

    if otp.tmp_code === params[:otp]
      otp.update(verified: true)
       user.update(phone_number_verified: true)
      redirect_to posts_path, notice: "Signup successful!" 
    else
      
      redirect_to root_path, notice:"Invalid OTP or OTP already used, Errors: #{otp.errors.full_messages.join(', ')}"

    end
  end

  def show

       user_id = params[:id]
       
        @user = User.find_by(id: user_id)
       
        otp = Otpsetup.find_by(user_id: @user.id)
         
        if otp

          new_otp = TwilioClient.new.update_text(@user)
          otp_code = new_otp.body.split(': ').last.to_i
          otp.update(tmp_code: otp_code, verified: false)
          redirect_to root_path, notice: "New OTP sent successfully!"
        else
          redirect_to root_path, alert: "Invalid user or OTP not set up."
        end
  end

 
  





  
end

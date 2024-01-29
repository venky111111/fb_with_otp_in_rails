class HomeController < ApplicationController
	def index
     if user_signed_in? && current_user.phone_number_verified === true && current_user.otpsetup.verified === true
      redirect_to posts_path
    else
      redirect_to otp_index_path
    end
  end
end

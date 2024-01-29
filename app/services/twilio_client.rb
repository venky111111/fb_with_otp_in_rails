class TwilioClient
  def initialize
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(user)
    otp_code = set_sms_code
    message_body = "Thanks for joining Syam's Facebook app. Your OTP is: #{otp_code}"

    @client.messages.create(
      from: phone_number,
      to: user.phonenumber,
      body: message_body
    )
    Otpsetup.create(
      tmp_code: otp_code,
      verified: false,  
      user_id: user.id
    )
  end
  def update_text(user)
    tmpp_code = set_sms_code
    message_body = "Thanks for joining Syam's Facebook app. Your OTPm is: #{tmpp_code}"

    @client.messages.create(
      from: phone_number,
      to: user.phonenumber,
      body: message_body
    )
  end 

    def set_sms_code
        @code = Random.rand(1012..9292)
    end


  private

  def account_sid
    Rails.application.credentials.twilio[:account_sid]
  end

  def auth_token
    Rails.application.credentials.twilio[:auth_token]
  end

  def phone_number
    Rails.application.credentials.twilio[:phone_number]
  end
end

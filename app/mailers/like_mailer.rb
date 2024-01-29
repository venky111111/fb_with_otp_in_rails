class LikeMailer < ApplicationMailer
	def like_email(user, liker)
      	
      @user = user.email
      @liker = liker.name
     	binding.pry
        mail(to: @user, subject: 'Welcome to My Awesome Facebook Site')

      end
end

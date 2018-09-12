class UserMailer < ApplicationMailer


  default from: 'taqtaqbet@gmail.com'
 



  def signup_confirmation(user)
    @user = user
    mail to: user.usermail, subject: "welcome"
  end




end

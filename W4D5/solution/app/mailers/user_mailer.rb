class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: 'locphan2207@gmail.com', subject: 'Welcome to My 99cats Site')
  end
  
end
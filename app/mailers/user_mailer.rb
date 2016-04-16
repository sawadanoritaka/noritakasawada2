class UserMailer < ApplicationMailer
  default from: 'snp.inc.info@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://mighty-tank-158568.nitrousapp.com:3000/show/part3'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

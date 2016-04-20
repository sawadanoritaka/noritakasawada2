class UserMailer < ApplicationMailer
 default from: 'notifications@example.com'

  def welcome_email(show)
    @show = show.message
    mail to: ENV["GMAIL_ADDRESS"], subject: "質問"
  end
end

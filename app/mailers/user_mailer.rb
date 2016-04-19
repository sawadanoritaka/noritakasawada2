class UserMailer < ApplicationMailer
 default from: 'notifications@example.com'

  def welcome_email(show)
    @show = show.message
    mail to: "sawadadive@gmail.com", subject: "テスト"
  end
end

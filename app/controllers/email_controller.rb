class EmailController < ApplicationController
require 'gmail'
USERNAME='sawadadive@gmail.com' #gmailのアドレス
PASSWORD='dive1984' #gmailのパスワード
  def box
   @gmail = Gmail.new(USERNAME,PASSWORD)
   @mails =  @gmail.inbox.emails(:all).map

     mail_config
     @mails = Mail.find(count:10, order: :desc, what: :all)
     @show = Show.all
  end
  
  def mail_config
   Mail.defaults do
        retriever_method :pop3, {
          :address => "pop.gmail.com",
          :port => 995,
          :user_name =>'recent:sawadadive@gmail.com',
          :password => 'dive1984',
          :enable_ssl => true
        }
      end
    
  end
end

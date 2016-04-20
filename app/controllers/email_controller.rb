class EmailController < ApplicationController
require 'gmail'
USERNAME= ENV["GMAIL_ADDRESS"] #gmailのアドレス
PASSWORD= ENV["GMAIL_PASSWORD"] #gmailのパスワード
  def box
   @gmail = Gmail.new(USERNAME,PASSWORD)
   @mails =  @gmail.inbox.emails(:all).map

     @mails = Mail.find(count:10, order: :desc, what: :all)

  end

  def mail_config
   Mail.defaults do
        retriever_method :pop3, {
          :address => "pop.gmail.com",
          :port => 995,
          :user_name =>ENV["GMAIL_ADDRESS"],
          :password => ENV["GMAIL_PASSWORD"],
          :enable_ssl => true
        }
      end

  end
end

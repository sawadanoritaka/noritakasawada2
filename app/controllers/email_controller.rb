class EmailController < ApplicationController

  def box
     mail_config
     @mails = Mail.find(count:10, order: :desc, what: :all)
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

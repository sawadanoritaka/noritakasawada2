# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings =
{
:user_name => "app47462715@heroku.com",
:password => "joqgvo9q3260",
:domain => "heroku.com",
:address => "smtp.sendgrid.net",
:port => 587,
:authentication => :plain,
:enable_starttls_auto => true
}
  Mail.defaults do
        retriever_method :pop3, {
          :address => "pop.gmail.com",
          :port => 995,
          :user_name => 'snp.inc.info@gmail.com',
          :password => 'vugpqqiyxmztfigm',
          :enable_ssl => true
        }
      end
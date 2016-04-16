class ShowController < ApplicationController
require 'mail'

Mail.defaults do
  delivery_method :smtp, {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => 'smtp.gmail.com',
    :user_name => 'snp.inc.info@gmail.com',
    :password => 'sawadanoritaka',
    :authentication => 'plain',
    :enable_starttls_auto => true
  }
end



  def part1
    if params[:back]
      @show = Show.new(show_params)
    else
        @show = Show.new
    end
  end
  def part2
   # 入力値のチェック
    @show = Show.new(show_params)
    if @show.valid?
      render :action => 'part2'
    else
      render :action => 'part1'
    end
  end
  def part3

    @show = Show.new(show_params)
    @show.save
    Mail.defaults do
  delivery_method :smtp, {
  :user_name => "app47462715@heroku.com",
  :password => "joqgvo9q3260",
  :domain => "heroku.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
end
    @m = Mail.new do
      from "snp.inc.info@gmail.com"
      to "snp.inc.info@gmail.com"
      subject "test mail subject"
      body "メール送信完了  \n  しばしお待ち下さい"
    end
      # 本文のエンコーディング設定。これを書かないと実行時にワーニングが出る
      @m.charset = "UTF-8"
      @m.content_transfer_encoding = "8bit"
      @m.deliver
          redirect_to root_path
  end

 private
  def show_params
    params.require(:show).permit(:name, :email ,:message)
  end
end

class EmailController < ApplicationController
  def box
        @mail = Mail.first(3)
      end
  end

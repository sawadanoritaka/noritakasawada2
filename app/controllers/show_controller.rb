class ShowController < ApplicationController
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
   UserMailer.welcome_email(@show).deliver

end

 private
  def show_params
    params.require(:show).permit(:name, :email ,:message)
  end
end

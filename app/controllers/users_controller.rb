class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(id_params[id])
  end
  def edit
  end

  def update
  cirrent_user.update(update_params)
  end
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        #　保存後にUserMailerにウェルカムメールを送信するように指示
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
private
  def id_patrams
    params.permit(:id)
  end
  def update_params
    params.require(:user).permit(:name,:profile)
  end
end

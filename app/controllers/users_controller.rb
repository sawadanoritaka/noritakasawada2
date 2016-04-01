class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[id])
  end
  def edit
  end

  def update
  cirrent_user.update(update_params)
  end


private
  def id_patrams
    params.permit(:id)
  end
  def update_params
    params.require(:user).permit(:name,:profile)
  end
end

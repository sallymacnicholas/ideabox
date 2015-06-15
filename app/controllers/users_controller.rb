class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.notice = 'Invalid Login'
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

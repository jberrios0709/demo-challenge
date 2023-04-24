class UsersController < ApplicationController
  skip_before_action :valid_session, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_permit)

    return render :new, status: :unprocessable_entity unless @user.save

    @user.save
    redirect_to login_path
  end

  private

  def params_permit
    params.require(:user).permit(:username, :password)
  end
end

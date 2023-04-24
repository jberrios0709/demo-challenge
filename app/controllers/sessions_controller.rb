class SessionsController < ApplicationController
  skip_before_action :valid_session, only: [:new, :create]
  def new
    @user = User.new
  end
  def create
    @user = User.find_by(username: params_permit[:username])
    if @user&.authenticate(params_permit[:password])
      session[:user_id] = @user.id
      redirect_to upload_file_url
    else
      redirect_to login_path, notice: I18n.t(:invalid_login)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: I18n.t(:logout)
  end

  private

  def params_permit
    params.require(:user).permit(:username, :password)
  end
end

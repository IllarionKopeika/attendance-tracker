class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { flash[:danger] = "稍后再试"
                                                                  redirect_to login_path
                                                                }

  def new
    if authenticated?
      flash[:info] = "已登录的"
      redirect_to root_path
    end
  end

  def create
    if user = User.authenticate_by(params.permit(:email, :password))
      flash[:success] = "登录成功"
      start_new_session_for user
      redirect_to after_authentication_url
    else
      flash[:danger] = "账号或密码错误"
      redirect_to login_path
    end
  end

  def destroy
    flash[:info] = "退出成功"
    terminate_session
    redirect_to root_path
  end
end

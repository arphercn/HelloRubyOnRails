class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # 登入用户，然后重定向到用户的资料页面
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      #redirect_to @user
      redirect_back_or @user # 登陆后跳转到前一个页面
    else
      # 创建一个错误消息
      flash.now[:danger] = 'Invalid email/password combination' # 不完全正确
      render 'new'
    end
  end

  def destroy
    log_out if logged_in? # 防止一个页面退出后,其他标签页点击退出,forget(current_user)报错
    redirect_to root_url
  end
end

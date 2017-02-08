class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]    # 第一种情况

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  # 考虑四种情况：
  # 密码重设请求已过期
  # 填写的新密码无效，更新失败
  # 没有填写密码和密码确认，更新失败（看起来像是成功了）
  # 成功更新密码
  def update
    if params[:user][:password].empty?                  # 第三种情况
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)          # 第四种情况
      log_in @user
      @user.update_attribute(:reset_digest, nil) # 成功重设密码后清除重设摘要
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render 'edit'                                     # 第二种情况
    end
  end

  private

    def user_params
      # 指定允许修改 password 和 password_confirmation 两个属性
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # 确保是有效用户
    def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # 检查重设令牌是否过期
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end

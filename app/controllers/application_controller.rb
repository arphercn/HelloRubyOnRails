class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  
  def hello
    render html: "hello, world!"
  end

  private

    # 确保用户已登录
    def logged_in_user
      unless logged_in?
        store_location # 编辑用户资料页面时,储存当前url
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end

class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: @user.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: @user.email, subject: "Password reset" # !!arpher note: add @
  end

  def daily_email(user)
    @var = "var"
    @user = user

    # 发件人是这里的 from，不是上面 smtp_settings 里设置的
    #mail(to: "201313488@qq.com", from: "bfengyi@126.com", subject: "test") do |format|
    #  format.text
    #  format.html
    #end
    mail to: @user.email, subject: "Account activation"
  end
end

class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset_password(user)
    @user = user
    @token = @user.signed_id(purpose: "password_reset", expires_in: 15.minutes)

    mail to: @user.email, subject: "Password reset email"
  end
end

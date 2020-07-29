class UserMailer < ApplicationMailer
  default from: 'angusl.zanshin@gmail.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Thanks for signing up with Susscribe')
  end

end

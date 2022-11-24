class UserMailer < ApplicationMailer
  default from: 'animalkingdom@lewagon.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

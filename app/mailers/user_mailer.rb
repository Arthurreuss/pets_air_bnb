class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to Animal Kingdom')
  end
end

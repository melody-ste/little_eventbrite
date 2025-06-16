class UserMailer < ApplicationMailer
  default from: ENV["GMAIL_USERNAME"]

  def welcome_email(user)
    @user = user 

    @url  = 'http://little_eventbrite.fr/login' 

    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
end

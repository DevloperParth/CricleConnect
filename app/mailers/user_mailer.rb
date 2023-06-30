class UserMailer < ApplicationMailer
  default from: 'kuldeeplovanshi777@@gmail.com'

  def welcome_email(user)
    @user=user
    mail to: user.email, subject:"welcome to my site CircleConnet",from: "kuldeeplovanshi777@gmail.com"
  end
end

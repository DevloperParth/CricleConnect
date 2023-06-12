class PostMailer < ApplicationMailer
  default from: 'kuldeeplovanshi777@@gmail.com'
  def new_post(user)
    @user=user
    mail to: user.email, subject:"Successfully added post on Circleconnec",from: "kuldeeplovanshi777@gmail.com"
  end
end

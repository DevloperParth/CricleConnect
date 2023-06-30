class PostMailer < ApplicationMailer
  default from: 'kuldeeplovanshi777@gmail.com'
 
  def new_post(post)
    @post=post
    mail to: post.user.email, subject:"Successfully added post on Circleconnec",from: "kuldeeplovanshi777@gmail.com"
  end 
end

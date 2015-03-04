class UserMailer < ActionMailer::Base
  default from: 'spark@spark.com'

  def comment user, mentor, reply
    @user = user
    @reply = reply
    @host = "localhost:3000"
    mail(to: user.email, subject: "#{mentor.name} replied to your question")
  end

  def daily_ama user
    @host = "localhost:3000"
    mail(to: user.email, subject: "New Amas are Up!")
  end

  def mentor_promotion user
    @host = "localhost"
    mail(to: user.email, subject: "You're a mentor now!")
  end

  def ama_approval user, ama
    @user = user
    @ama = ama
    mail(to: user.email, subject: "Ama ready now")
  end

  def ama_publishing user, ama
    @user = user
    @ama = ama
    mail(to: user.email, subject: "Ama now published")
  end
  
end




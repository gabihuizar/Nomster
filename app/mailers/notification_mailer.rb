class NotificationMailer < ActionMailer::Base
  default from: "no-reply@burp.com"

  def comment_added
  	mail(to: "gabriellacastaneda@gmail.com",
  		subject: "A comment has been added to your brewery!")
  end

end

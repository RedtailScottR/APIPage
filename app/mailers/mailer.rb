class mailer < ActionMailer::Base
  default from: "APIPage@RedtailTechnology.com"

 def welcome_email(user)
    @partner = partner
    @url  = "http://example.com/login"
    mail(:to => partner.email, :subject => "Welcome to My Awesome Site")
  end
  end
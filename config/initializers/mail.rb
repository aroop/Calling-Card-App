ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_charset = "utf-8"
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :tls => true,
  :port => 587,
  :authentication => :plain,
  :user_name => "no-reply@IndiaISD.com",
  :domain => "IndiaISD.com",
  :password => "confirm12ab!"
}
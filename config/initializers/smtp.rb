ActionMailer::Base.smtp_settings = {
  address:        "smtp.sendgrid.net",
  port:            587,
  authentication: :plain,
  user_name:      "apikey",
  password:       Rails.application.credentials.sendgrid[:api_key],
  # domain:         "angusl.zanshin@gmail.com"
}
# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: "apikey",
  password: Rails.application.credentials.sendgrid[:api_key],
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  # domain: "angusl.zanshin@gmail.com",
  enable_starttls_auto: true
}
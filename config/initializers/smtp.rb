ActionMailer::Base.smtp_settings = {
    :user_name => ENV['smtp_user_name'],
    :password => ENV['smtp_password'],
    :address => ENV['smtp_address'],
    :domain => ENV['smtp_domain'],
    :port => ENV['smtp_port'],
    :authentication => ENV['smtp_authentication']
  }
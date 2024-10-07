class ApplicationMailer < ActionMailer::Base
  default from: ENV["ACTION_MAILER_SMTP_ADDRESS"]
  layout "mailer"
end

class ApplicationMailer < ActionMailer::Base
  default from: "Test <test@example.com>"
  layout 'mailer'
end

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def mail_method(data,email,subject)
    @body=data
    mail(to: email, subject: subject)
  end
end

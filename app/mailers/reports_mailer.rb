class ReportsMailer < ApplicationMailer
  default from: 'report@example.com'

  def report_email(users, email)
    @users = users
    mail(to: email, subject: 'Report')
  end
end

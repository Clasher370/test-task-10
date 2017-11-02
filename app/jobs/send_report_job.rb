class SendReportJob < ApplicationJob
  queue_as :default

  def perform(start_date, end_date, email)
    users = User.posts_and_comments_count(start_date, end_date)
    ReportsMailer.report_email(users, email).deliver_now
  end
end

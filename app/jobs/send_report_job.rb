class SendReportJob < ApplicationJob
  queue_as :default

  def perform(start_date, end_date, email)
    users = User.find_by_sql ["SELECT u.id,
                               u.nickname,
                               u.email,
                               COUNT(DISTINCT p.id) posts_count,
                               COUNT(DISTINCT c.id) comments_count,
                               ((COUNT(DISTINCT p.id) + COUNT(DISTINCT c.id)) / CAST(10 AS float)) sort
                               FROM((users u
                               LEFT OUTER JOIN posts p
                               ON u.id = p.author_id AND(p.published_at BETWEEN ? AND ?))
                               LEFT OUTER JOIN comments c
                               ON u.id = c.author_id AND(c.published_at BETWEEN ? AND ?))
                               GROUP BY(u.id)
                               ORDER BY sort", start_date, end_date, start_date, end_date]
    ReportsMailer.report_email(users, email).deliver_now
  end
end

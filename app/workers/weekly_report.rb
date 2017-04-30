class WeeklyReport
  include Sidekiq::Worker

  def perform
    Reporter.weekly_report.deliver_now
  end
end

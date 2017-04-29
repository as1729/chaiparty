class WeeklyReport
  include Sidekiq::Worker
  sidekiq_options queue: :low, retry: 1

  def perform
    Reporter.weekly_report.deliver
  end
end

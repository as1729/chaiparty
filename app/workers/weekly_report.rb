class WeeklyReport
  include Sidekiq::Worker
  sidekiq_options queue: :low, retry: 1

  def perform
    mail = Mail.new do
      from    'aditya@ForThePeople.Vote'
      to      'aditus06@gmail.com'
      subject 'Weekly Voter Report'
      body    'This is what your congressperson did last week!'
    end
    mail.deliver!
  end
end

class Reporter < ActionMailer::Base
  include SendGrid
  default from: 'Aditya Sridhar <aditya@ForThePeople.Vote>'

  def weekly_report
    mail to: "aditus06@gmail.com", subject: "ForThePeople Congressperson Weekly Report"
  end
end
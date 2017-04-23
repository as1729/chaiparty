require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork

  handler do |job|
    puts "Running #{job}"
  end
  every(1.day, "weekly.report", at: "10:41") do
    WeeklyReport.perform_async
  end
end
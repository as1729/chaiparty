require 'clockwork'
require '../config/boot'
require '../config/environment'

module Clockwork

  handler do |job|
    puts "Running #{job}"
  end
  every(2.minutes, "weekly.report") do
    WeeklyReport.perform_async
  end
end
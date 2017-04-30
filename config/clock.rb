require 'clockwork'
require File.expand_path("../config/boot", File.dirname(__FILE__))
require File.expand_path("../config/environment", File.dirname(__FILE__))

module Clockwork

  handler do |job|
    puts "Running #{job}"
  end
  every(2.hours, "weekly.report") do
    WeeklyReport.perform_async
  end
end
require 'clockwork'

require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    job.gsub('.', '_').camelize.constantize.perform_later
  end

  # every(10.seconds, 'frequent.job')
  # every(3.minutes, 'less.frequent.job')
  # every(1.hour, 'hourly.job')
  # every(1.day, 'midnight.job', at: '00:00')
end

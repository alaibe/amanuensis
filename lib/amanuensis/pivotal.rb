require 'tracker_api'

require_relative 'pivotal/configuration'
require_relative 'pivotal/tracker'

Tracker.register :pivotal, Trello::Tracker.new

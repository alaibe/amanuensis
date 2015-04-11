require 'trello'

require_relative 'trello/configuration'
require_relative 'trello/tracker'

Tracker.register :trello, Trello::Tracker.new

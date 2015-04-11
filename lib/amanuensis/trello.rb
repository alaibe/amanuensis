require 'trello'

module Amanuensis
  module Trello
    include ActiveSupport::Configurable
    config_accessor(:list)
    config_accessor(:key)
    config_accessor(:token)
    config_accessor(:board)
  end
end

require_relative 'trello/tracker'

Tracker.register :trello, Trello::Tracker.new

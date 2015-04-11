require 'trello'

module Amanuensis
  module Trello
    include ActiveSupport::Configurable
  end
end

require_relative 'trello/tracker'

Tracker.register :trello, Trello::Tracker.new

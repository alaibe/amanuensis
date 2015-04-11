require 'trello'

require_relative 'trello/tracker'

module Amanuensis
  module Trello
    include ActiveSupport::Configurable
    config_accessor(:list)
    config_accessor(:key)
    config_accessor(:token)
    config_accessor(:board)

    def self.valid!
      true
    end
  end

  Tracker.register :trello, Trello::Tracker.new
end

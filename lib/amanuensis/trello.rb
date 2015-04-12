require 'trello'

require_relative 'trello/tracker'

module Amanuensis
  module Trello
    include ActiveSupport::Configurable
    include Validatable

    config_accessor(:list)
    config_accessor(:key)
    config_accessor(:token)
    config_accessor(:board)

    validate_presence_of :list, :key, :token, :board
  end

  Tracker.register :trello, Trello::Tracker.new
end

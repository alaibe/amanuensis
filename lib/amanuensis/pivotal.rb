require 'tracker_api'

module Amanuensis
  module Pivotal
    include ActiveSupport::Configurable
    config_accessor(:token)
    config_accessor(:project)
  end
end

require_relative 'pivotal/tracker'

Tracker.register :pivotal, Trello::Tracker.new

require 'tracker_api'

module Amanuensis
  module Pivotal
    include ActiveSupport::Configurable
  end
end

require_relative 'pivotal/tracker'

Tracker.register :pivotal, Trello::Tracker.new

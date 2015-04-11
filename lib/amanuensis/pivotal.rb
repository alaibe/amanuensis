require 'tracker_api'

require_relative 'pivotal/tracker'

module Amanuensis
  module Pivotal
    include ActiveSupport::Configurable
    config_accessor(:token)
    config_accessor(:project)

    def self.valid!
      true
    end
  end

  Tracker.register :pivotal, Pivotal::Tracker.new
end

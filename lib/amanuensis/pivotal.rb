require 'tracker_api'

require_relative 'pivotal/tracker'

module Amanuensis
  module Pivotal
    include ActiveSupport::Configurable
    include Validatable

    config_accessor(:token)
    config_accessor(:project)

    validate_presence_of :token, :project
  end

  Tracker.register :pivotal, Pivotal::Tracker.new
end

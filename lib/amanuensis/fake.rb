module Amanuensis
  module Fake
    include ActiveSupport::Configurable
  end
end

require_relative 'fake/code_manager'
require_relative 'fake/tracker'
require_relative 'fake/push'

Push.register        :fake, Fake::Push.new
CodeManager.register :fake, Fake::CodeManager.new
Tracker.register     :fake, Fake::Tracker.new

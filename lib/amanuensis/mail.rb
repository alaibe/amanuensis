require 'pony'

module Amanuensis
  module Mail
    include ActiveSupport::Configurable
    config_accessor(:pony) {{}}
  end
end

require_relative 'mail/push'

Push.register :mail, Mail::Push.new

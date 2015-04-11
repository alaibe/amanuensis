require 'pony'

require_relative 'mail/push'

module Amanuensis
  module Mail
    include ActiveSupport::Configurable
    config_accessor(:pony) {{}}

    def self.valid!
      true
    end
  end

  Push.register :mail, Mail::Push.new
end



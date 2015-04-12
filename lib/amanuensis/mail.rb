require 'pony'

require_relative 'mail/push'

module Amanuensis
  module Mail
    include ActiveSupport::Configurable
    include Validatable

    config_accessor(:pony) {{}}

    validate_presence_of :pony
  end

  Push.register :mail, Mail::Push.new
end



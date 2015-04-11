require 'pony'

require_relative 'mail/configuration'
require_relative 'mail/push'

Push.register :mail, Mail::Push.new

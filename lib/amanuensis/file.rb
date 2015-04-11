module Amanuensis
  module File
    include ActiveSupport::Configurable
  end
end

require_relative 'file/push'

Push.register :file, File::Push.new

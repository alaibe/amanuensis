module Amanuensis
  module File
    include ActiveSupport::Configurable
    config_accessor(:file_name) { 'Changelog.md' }
  end
end

require_relative 'file/push'

Push.register :file, File::Push.new

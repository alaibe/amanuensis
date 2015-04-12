require_relative 'file/push'

module Amanuensis
  module File
    include ActiveSupport::Configurable
    include Validatable

    config_accessor(:file_name) { 'Changelog.md' }
  end

  Push.register :file, File::Push.new
end



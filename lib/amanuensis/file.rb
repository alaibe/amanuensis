require_relative 'file/push'

module Amanuensis
  module File
    include ActiveSupport::Configurable
    config_accessor(:file_name) { 'Changelog.md' }

    def self.valid!
      true
    end
  end

  Push.register :file, File::Push.new
end



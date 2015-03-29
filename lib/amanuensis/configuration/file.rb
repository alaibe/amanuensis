module Amanuensis
  class Configuration
    class File

      attr_accessor :file_name

      def initialize
        @file_name = 'Changelog.md'
      end

      def valid?
        raise FileConfigurationError if file_name.blank?
      end

    end
  end
end

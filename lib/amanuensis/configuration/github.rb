module Amanuensis
  class Configuration
    class Github

      attr_accessor :oauth_token, :file_name

      def initialize
        @file_name = 'Changelog.md'
      end

      def valid!
        raise GithubConfigurationError if oauth_token.blank?
      end

    end
  end
end

module Amanuensis
  class Configuration
    class Github

      attr_accessor :oauth_token

      def valid!
        raise GithubConfigurationError if oauth_token.blank?
      end

    end
  end
end

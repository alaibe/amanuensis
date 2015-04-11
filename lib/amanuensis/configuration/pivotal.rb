module Amanuensis
  class Configuration
    class Pivotal

      attr_accessor :token, :project

      def valid!
        raise PivotalConfigurationError if token.blank? || project.blank?
      end

    end
  end
end

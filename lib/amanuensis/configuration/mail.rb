module Amanuensis
  class Configuration
    class Mail

      attr_accessor :pony

      def initialize
        @pony = {}
      end

      def valid!
        raise MailConfigurationError if pony.blank?
      end

    end
  end
end

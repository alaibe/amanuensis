module Amanuensis
  module Mail
    class Push

      def run(changelog)
        Pony.mail options.merge(body: changelog)
      end

      private

      def options
        HashWithIndifferentAccess.new Mail.pony
      end

    end

  end
end

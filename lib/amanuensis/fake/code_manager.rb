module Amanuensis
  module Fake
    class CodeManager

      def latest_release
        Release.new(Date.new(2015), '1.0.0')
      end

      def create_release(_)
      end

      def pulls(_)
        []
      end

    end
  end
end

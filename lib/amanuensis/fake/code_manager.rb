module Amanuensis
  module Fake
    class CodeManager

      def latest_release(_)
        Release.new(Date.new(2015), '1.0.0')
      end

      def create_release(_, _)
      end

    end
  end
end

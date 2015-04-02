module Amanuensis
  class CodeManager
    class Fake

      def latest_release(_)
        Release.new(created_at: 1.day.ago, tag: '1.0.0')
      end

      def create_release(_, _)
      end

    end
  end
end

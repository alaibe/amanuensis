module Amanuensis
  class Tracker
    class Fake

      def issues(_, _)
        [Issue.new(1, 'https://www.google.com', 'Issue')]
      end

      def pulls(_, _)
        [Pull.new(1, 'https://www.google.com', 'Issue')]
      end

    end
  end
end

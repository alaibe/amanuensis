module Amanuensis
  module Fake
    class Tracker

      def issues(_)
        [Issue.new(1, 'https://www.google.com', 'Issue')]
      end

    end
  end
end

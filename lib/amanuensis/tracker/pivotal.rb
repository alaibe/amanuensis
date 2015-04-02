module Amanuensis
  class Tracker
    class Pivotal

      def issues(from, configuration)
        set_token(configuration.token)
      end


      def pulls(_, _)
        []
      end

      private

      def set_token(token)
        PivotalTracker::Client.token = token
      end

    end
  end
end

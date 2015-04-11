module Amanuensis
  class Tracker
    class Pivotal

      def issues(from, configuration)
        client = TrackerApi::Client.new(token: configuration.token)
        project = client.projects.find { |project| project.name == configuration.project }

        project.stories.select do |story|
          story.current_state == 'accepted' && story.accepted_at.to_time > from.to_time
        end.map do |story|
          Issue.new story.id, story.url, story.name
        end
      end


      def pulls(_, _)
        []
      end

    end
  end
end

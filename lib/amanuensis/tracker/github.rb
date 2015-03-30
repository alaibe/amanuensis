module Amanuensis
  class Tracker
    class Github

      def issues(from, configuration)
        filter(client(configuration.oauth_token).list_issues(configuration.repo, state: 'closed'), from).select { |issue| !issue['html_url'].include?('pull') }
      end

      def pulls(from, configuration)
        filter client(configuration.oauth_token).pull_requests(configuration.repo, state: 'closed'), from
      end

      private

      def filter(list, from)
        list.select { |object| object.closed_at > from.to_time }
      end

      def client(oauth_token)
        Octokit::Client.new(access_token: oauth_token, auto_paginate: true)
      end

    end
  end
end

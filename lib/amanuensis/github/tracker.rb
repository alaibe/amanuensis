module Amanuensis
  module Github
    class Tracker

      def issues(from)
        filter(closed_issues, from).map do |issue|
          Issue.new issue['number'], issue['html_url'], issue['title']
        end
      end

      private

      def filter(list, from)
        list.select { |object| object.closed_at > from.to_time }
      end

      def closed_issues
        client.list_issues(Github.repo, state: 'closed').select do |issue|
          !issue['html_url'].include?('pull')
        end
      end

      def closed_pulls
        client.pull_requests(Github.repo, state: 'closed')
      end

      def client
        Octokit::Client.new(access_token: Github.oauth_token, auto_paginate: true)
      end

    end
  end
end

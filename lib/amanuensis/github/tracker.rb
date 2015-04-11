module Amanuensis
  module Github
    class Tracker

      def issues(from)
        filter(closed_issues, from).map do |issue|
          Issue.new issue['number'], issue['html_url'], issue['title']
        end
      end

      def pulls(from)
        filter(closed_pulls, from).map do |pull|
          Pull.new pull['number'], pull['html_url'], pull['title']
        end
      end

      private

      def filter(list, from)
        list.select { |object| object.closed_at > from.to_time }
      end

      def closed_issues
        client(configuration.oauth_token).list_issues(configuration.repo, state: 'closed').select do |issue|
          !issue['html_url'].include?('pull')
        end
      end

      def closed_pulls
        client(configuration.oauth_token).pull_requests(configuration.repo, state: 'closed')
      end

      def client(oauth_token)
        Octokit::Client.new(access_token: oauth_token, auto_paginate: true)
      end

    end
  end
end

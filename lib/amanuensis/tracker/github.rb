module Amanuensis
  class Tracker
    class Github

      def issues(repo, oauth_token, from)
        filter(client(oauth_token).list_issues(repo, state: 'closed'), from).select { |issue| !issue['html_url'].include?('pull') }
      end

      def pulls(repo, oauth_token, from)
        filter client(oauth_token).pull_requests(repo, state: 'closed'), from
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

module Amanuensis
  class Tracker
    class Github

      def issues(name, oauth_token, from)
        filter client(oauth_token).list_issues(name, state: 'closed'), from
      end

      def pulls(name, oauth_token, from)
        filter client(oauth_token).pull_requests(name, state: 'closed'), from
      end

      private

      def filter(list, from)
        list.select { |object| object.closed_at < from.to_time }
      end

      def client(oauth_token)
        Octokit::Client.new(access_token: oauth_token, auto_paginate: true)
      end

    end
  end
end

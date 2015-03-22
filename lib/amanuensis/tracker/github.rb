module Amanuensis
  class Tracker
    class Github

      def issues(name, oauth_token, from)
        client.list_issues(name, state: 'closed')
      end

      def pulls(name, oauth_token, from)
        client.pull_requests(name, state: 'closed')
      end

      private

      def client(oauth_token)
        Octokit::Client.new(access_token: oauth_token, auto_paginate: true)
      end

    end
  end
end

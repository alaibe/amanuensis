module Amanuensis
  module Builders
    class Github < Struct.new(:name, :release, :configuration)

      def build
      end

      private

      def client
        @client ||= Octokit::Client.new(access_token: configuration.github_oauth_token, auto_paginate: true)
      end

      def issues
        @issues ||= client.list_issues(name, state: 'closed')
      end

      def pulls
        @pulls ||= client.pull_requests(name, state: 'closed')
      end

    end
  end
end

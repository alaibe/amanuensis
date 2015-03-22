module Amanuensis
  class BuilderService
    class Github

      def build(name, release, configuration)
        Builder.new(name, release, configuration).build
      end

      class Builder < Struct.new(:name, :release, :configuration)

        def build

        end

        def client
          @client ||= Octokit::Client.new(access_token: configuration.oauth_token, auto_paginate: true)
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
end

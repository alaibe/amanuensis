module Amanuensis
  module Github
    class CodeManager

      def latest_release
        hash       = client(configuration.oauth_token).latest_release(configuration.repo)
        created_at = hash.created_at rescue Date.new(1900)

        Release.new hash.created_at, hash.tag_name
      end

      def create_release(version)
        client(configuration.oauth_token).create_release(configuration.repo, version, {
          body:       "Release generated by amanuensis.",
          draft:      false,
          prerelease: false
        })
      end

      private

      def client(oauth_token)
        @client ||= Octokit::Client.new(access_token: oauth_token, auto_paginate: true)
      end

    end
  end
end

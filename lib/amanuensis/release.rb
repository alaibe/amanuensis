module Amanuensis
  class Release < Struct.new(:name, :github_oauth_token)

    def latest
      client.latest_release(name)
    end

    def create
    end

    private

    def client
      @client ||= Octokit::Client.new(access_token: configuration.github_oauth_token, auto_paginate: true)
    end

  end
end

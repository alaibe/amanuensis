require 'octokit'

require_relative 'github/code_manager'
require_relative 'github/tracker'
require_relative 'github/push'

module Amanuensis
  module Github
    include ActiveSupport::Configurable
    config_accessor(:oauth_token)
    config_accessor(:repo)
    config_accessor(:file_name)   { 'Changelog.md' }

    def valid!
      true
    end
  end

  Push.register        :github, Github::Push.new
  CodeManager.register :github, Github::CodeManager.new
  Tracker.register     :github, Github::Tracker.new
end



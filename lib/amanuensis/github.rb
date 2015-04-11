require 'octokit'

require_relative 'github/configuration'
require_relative 'github/code_manager'
require_relative 'github/tracker'
require_relative 'github/push'

Push.register        :github, Github::Push.new
CodeManager.register :github, Github::CodeManager.new
Tracker.register     :github, Github::Tracker.new

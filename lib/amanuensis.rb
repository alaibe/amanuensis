require 'interchange'
require 'octokit'
require 'thor'

require_relative "amanuensis/code_manager"
require_relative "amanuensis/code_manager/github"

require_relative "amanuensis/push"
require_relative "amanuensis/push/mail"
require_relative "amanuensis/push/file"

require_relative "amanuensis/tracker"
require_relative "amanuensis/tracker/github"

require_relative "amanuensis/version"
require_relative "amanuensis/configuration"
require_relative "amanuensis/cli"
require_relative "amanuensis/generator"
require_relative "amanuensis/builder"

module Amanuensis
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.generate(name, version)
    Generator.new(name, version, configuration).run!
  end

  Push.register :mail, Push::Mail.new
  Push.register :file, Push::File.new

  CodeManager.register :github, CodeManager::Github.new

  Tracker.register :github, Tracker::Github.new
end

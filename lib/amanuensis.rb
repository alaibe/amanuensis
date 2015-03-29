require 'interchange'
require 'octokit'
require 'thor'
require 'pony'
require 'active_support/core_ext/object/blank'

require_relative "amanuensis/version"
require_relative "amanuensis/cli"
require_relative "amanuensis/generator"
require_relative "amanuensis/builder"
require_relative "amanuensis/errors"
require_relative "amanuensis/logger"

require_relative "amanuensis/code_manager"
require_relative "amanuensis/code_manager/github"

require_relative "amanuensis/push"
require_relative "amanuensis/push/mail"
require_relative "amanuensis/push/file"

require_relative "amanuensis/tracker"
require_relative "amanuensis/tracker/github"

require_relative "amanuensis/configuration"
require_relative "amanuensis/configuration/github"
require_relative "amanuensis/configuration/mail"
require_relative "amanuensis/configuration/file"

module Amanuensis
  class << self
    attr_accessor :configurations
  end

  def self.configurations
    @configurations ||= reset
  end

  def self.reset
    @configurations = {
      global: Configuration.new,
      github: Configuration::Github.new,
      mail:   Configuration::Mail.new,
      file:   Configuration::File.new
    }
  end

  def self.configure(type = :global)
    yield(configurations[type.to_sym])
  end

  def self.generate(name, version)
    Generator.new(name, version, configurations).run!
  end

  Push.register :mail, Push::Mail.new
  Push.register :file, Push::File.new

  CodeManager.register :github, CodeManager::Github.new

  Tracker.register :github, Tracker::Github.new
end

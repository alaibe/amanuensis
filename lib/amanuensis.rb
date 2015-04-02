require 'interchange'
require 'octokit'
require 'thor'
require 'pony'
require 'trello'
require 'active_support/core_ext/object/blank'

require_relative "amanuensis/version"
require_relative "amanuensis/cli"
require_relative "amanuensis/generator"
require_relative "amanuensis/builder"
require_relative "amanuensis/errors"
require_relative "amanuensis/logger"

require_relative "amanuensis/code_manager"
require_relative "amanuensis/code_manager/github"
require_relative "amanuensis/code_manager/bitbucket"
require_relative "amanuensis/code_manager/fake"

require_relative "amanuensis/push"
require_relative "amanuensis/push/mail"
require_relative "amanuensis/push/file"
require_relative "amanuensis/push/github"
require_relative "amanuensis/push/fake"

require_relative "amanuensis/tracker"
require_relative "amanuensis/tracker/github"
require_relative "amanuensis/tracker/trello"
require_relative "amanuensis/tracker/pivotal"
require_relative "amanuensis/tracker/fake"

require_relative "amanuensis/configuration"
require_relative "amanuensis/configuration/github"
require_relative "amanuensis/configuration/mail"
require_relative "amanuensis/configuration/file"
require_relative "amanuensis/configuration/trello"
require_relative "amanuensis/configuration/pivotal"
require_relative "amanuensis/configuration/bitbucket"
require_relative "amanuensis/configuration/fake"

module Amanuensis
  class << self
    attr_accessor :configurations
  end

  def self.configurations
    @configurations ||= reset
  end

  def self.reset
    @configurations = {
      global:    Configuration.new,
      github:    Configuration::Github.new,
      bitbucket: Configuration::Bitbucket.new,
      trello:    Configuration::Trello.new,
      pivotal:   Configuration::Pivotal.new,
      mail:      Configuration::Mail.new,
      file:      Configuration::File.new,
      fake:      Configuration::Fake.new
    }
  end

  def self.configure(type = :global)
    yield(configurations[type.to_sym])
  end

  def self.generate
    Generator.new(configurations).run!
  end

  Push.register :mail,   Push::Mail.new
  Push.register :file,   Push::File.new
  Push.register :github, Push::Github.new
  Push.register :fake,   Push::Fake.new

  CodeManager.register :github,    CodeManager::Github.new
  CodeManager.register :bitbucket, CodeManager::Bitbucket.new
  CodeManager.register :fake,      CodeManager::Fake.new

  Tracker.register :github,  Tracker::Github.new
  Tracker.register :trello,  Tracker::Trello.new
  Tracker.register :fake,    Tracker::Fake.new
  Tracker.register :pivotal, Tracker::Fake.new
end

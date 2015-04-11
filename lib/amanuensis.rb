require 'interchange'
require 'thor'
require 'active_support/core_ext/object/blank'

require_relative 'amanuensis/version'
require_relative 'amanuensis/cli'
require_relative 'amanuensis/generator'
require_relative 'amanuensis/builder'
require_relative 'amanuensis/errors'
require_relative 'amanuensis/logger'

require_relative 'fake'
require_relative 'github'
require_relative 'trello'
require_relative 'pivotal'
require_relative 'mail'
require_relative 'file'

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
  CodeManager.register :fake,      CodeManager::Fake.new

  Tracker.register :github,  Tracker::Github.new
  Tracker.register :trello,  Tracker::Trello.new
  Tracker.register :fake,    Tracker::Fake.new
  Tracker.register :pivotal, Tracker::Pivotal.new
end

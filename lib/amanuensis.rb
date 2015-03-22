require 'active_support/inflections'

require_relative "amanuensis/code_manager"
require_relative "amanuensis/code_manager/github"

require_relative "amanuensis/push"
require_relative "amanuensis/push/mail"
require_relative "amanuensis/push/file"

require_relative "amanuensis/tracker"
require_relative "amanuensis/tracker/github"

require_relative "amanuensis/version"
require_relative "amanuensis/configuration"
require_relative "amanuensis/opt_parser"
require_relative "amanuensis/generator"

push = Push.new
push.register :mail, Push::Mail.new
push.register :file, Push::File.new

storage = CodeManager.new
storage.register :github, CodeManager::Github.new

tracker = Tracker.new
tracker.register :github, Tracker::Github.new

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

  def self.generate
    Generator.new(configuration).run!
  end
end

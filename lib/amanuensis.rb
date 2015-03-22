require 'active_support/inflections'

require_relative "amanuensis/storage_service/github"

require_relative "amanuensis/version"
require_relative "amanuensis/configuration"
require_relative "amanuensis/opt_parser"
require_relative "amanuensis/generator"

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

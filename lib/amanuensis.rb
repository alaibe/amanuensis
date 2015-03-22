require "amanuensis/version"
require "amanuensis/configuration"
require "amanuensis/opt_parser"

module Amanuensis
  class << self

    attr_accessor :configuration

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure
      yield(configuration)
    end

  end
end

require_relative "amanuensis/version"
require_relative "amanuensis/configuration"
require_relative "amanuensis/opt_parser"

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

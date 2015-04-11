require 'interchange'
require 'thor'
require 'active_support/core_ext/object/blank'
require 'active_support/configurable'

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
  include ActiveSupport::Configurable

  def self.generate
    Generator.new(configurations).run!
  end
end

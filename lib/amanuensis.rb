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
  config_accessor(:push)         { [:file] }
  config_accessor(:tracker)      { :github }
  config_accessor(:code_manager) { :github }
  config_accessor(:verbose)      { false }
  config_accessor(:version)      { :patch }

  def self.generate
    Generator.new(configurations).run!
  end
end

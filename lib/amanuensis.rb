require 'interchange'
require 'thor'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/hash'
require 'active_support/configurable'
require 'active_support/hash_with_indifferent_access'

require_relative 'amanuensis/version'
require_relative 'amanuensis/validatable'
require_relative 'amanuensis/cli'
require_relative 'amanuensis/generator'
require_relative 'amanuensis/builder'
require_relative 'amanuensis/logger'
require_relative 'amanuensis/push'
require_relative 'amanuensis/code_manager'
require_relative 'amanuensis/tracker'
require_relative 'amanuensis/issue'
require_relative 'amanuensis/pull'
require_relative 'amanuensis/release'

require_relative 'amanuensis/fake'
require_relative 'amanuensis/github'
require_relative 'amanuensis/trello'
require_relative 'amanuensis/pivotal'
require_relative 'amanuensis/mail'
require_relative 'amanuensis/file'

module Amanuensis
  include ActiveSupport::Configurable
  include Validatable

  config_accessor(:push)         { [:file] }
  config_accessor(:tracker)      { :github }
  config_accessor(:code_manager) { :github }
  config_accessor(:verbose)      { false }
  config_accessor(:release)      { true }
  config_accessor(:version)      { :patch }

  validate_presence_of :push, :tracker, :code_manager, :version

  def self.generate
    Generator.new.run!
  end
end

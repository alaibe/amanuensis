module Amanuensis
  class Configuration
    attr_accessor :push, :tracker, :code_manager, :verbose, :version

    def initialize
      @push         = [:file]
      @code_manager = :github
      @tracker      = :github
      @verbose      = false
      @version      = :patch
    end

    def valid!
      if push.blank? || code_manager.blank? || tracker.blank?
        raise GlobalConfigurationError
      end

      if !([:major, :minor, :patch].include? version.to_sym)
        raise GlobalConfigurationVersionError
      end
    end

  end
end

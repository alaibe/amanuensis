module Amanuensis
  class Configuration
    attr_accessor :push, :tracker, :code_manager

    def initialize
      @push           = [:file]
      @code_manager   = :github
      @tracker        = :github
    end

    def valid!
      if push.blank? || code_manager.blank? || tracker.blank?
        raise GlobalConfigurationError
      end
    end

  end
end

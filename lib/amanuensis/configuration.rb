module Amanuensis
  class Configuration
    attr_accessor :push, :tracker, :code_manager, :verbose

    def initialize
      @push         = [:file]
      @code_manager = :github
      @tracker      = :github
      @verbose      = false
    end

    def valid!
      if push.blank? || code_manager.blank? || tracker.blank?
        raise GlobalConfigurationError
      end
    end

  end
end

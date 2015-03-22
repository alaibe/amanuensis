module Amanuensis
  class Configuration
    attr_accessor :outputs, :tracker

    def initialize
      @outputs = []
    end

    def tracker_options
    end

    def push_options
    end

  end
end

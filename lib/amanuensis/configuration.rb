module Amanuensis
  class Configuration
    attr_accessor :outputs, :tracker

    def initialize
      @outputs = []
    end

  end
end

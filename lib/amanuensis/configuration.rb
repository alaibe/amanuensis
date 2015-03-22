module Amanuensis
  class Configuration
    attr_accessor :outputs, :tracker, :oauth_token

    def initialize
      @outputs = []
    end

  end
end

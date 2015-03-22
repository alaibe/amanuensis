module Amanuensis
  class Configuration
    attr_accessor :outputs, :tracker, :github_oauth_token

    def initialize
      @outputs = []
    end

  end
end

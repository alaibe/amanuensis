module Amanuensis
  class Configuration
    attr_accessor :push, :tracker, :oauth_token, :code_manager, :create_release

    def initialize
      @push           = [:file]
      @code_manager   = :github
      @tracker        = :github
      @create_release = false
    end

  end
end

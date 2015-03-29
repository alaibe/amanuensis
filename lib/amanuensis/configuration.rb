module Amanuensis
  class Configuration
    attr_accessor :push, :tracker, :code_manager

    def initialize
      @push           = [:file]
      @code_manager   = :github
      @tracker        = :github
    end

  end
end

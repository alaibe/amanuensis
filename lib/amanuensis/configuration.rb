module Amanuensis
  class Configuration
    attr_accessor :push, :tracker, :code_manager

    def initialize
      @push           = [:file]
      @code_manager   = :github
      @tracker        = :github
    end

    class Mail
      attr_accessor :pony

      def initialize
        @pony = {}
      end
    end

    class File
      attr_accessor :file_name

      def initialize
        @file_name = 'Changelog.md'
      end
    end

    class GithubCodeManager
      attr_accessor :oauth_token
    end

    class GithubTracker
      attr_accessor :oauth_token
    end

  end
end

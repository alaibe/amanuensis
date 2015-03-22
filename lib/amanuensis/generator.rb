module Amanuensis
  class Generator < Struct.new(:configuration)

    def run!
      check_required_configuration!

      push build

      create_release
    end

    private

    def build
      builder_class.new(configuration).build
    end

    def push(changelog)
    end

    def create_release
      #Release.new(:github_oauth_token).create
    end

    def check_required_configuration!
    end

    def builder_class
      "Amanuensis::Builders::#{configuration.tracker.classify}".constantize
    end
  end
end

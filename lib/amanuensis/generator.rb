module Amanuensis
  class Generator < Struct.new(:configuration)

    def run!
      check_required_configuration!

      release   = create_release
      changelog = build_changelog release, configuration.tracker_options

      push changelog, configuration.push_options
    end

    private

    def build_changelog(release, options = {})
    end

    def push(changelog, options = {})
    end

    def create_release
    end

    def check_required_configuration!
    end
  end
end

module Amanuensis
  class Generator < Struct.new(:name, :version, :configuration)

    def run!
      check_required_configuration!

      CodeManager.use configuration.code_manager

      result = push_changelog

      create_release if result.all?
    end

    private

    def changelog
      @changelog ||= Builder.new(name, version, from, configuration).build
    end

    def push_changelog
      @push_changelog ||= configuration.push.map do |type|
        Push.use type
        Push.run changelog, configuration
      end
    end

    def from
      latest_release.created_at rescue Date.new(1900)
    end

    def latest_release
      @latest_release ||= CodeManager.latest_release name, configuration.oauth_token
    end

    def create_release
      if configuration.create_release
        CodeManager.create_release name, version, configuration.oauth_token
      end
    end

    def check_required_configuration!
    end

  end
end

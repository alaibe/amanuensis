module Amanuensis
  class Generator < Struct.new(:name, :configuration)

    def run!
      check_required_configuration!

      CodeManager.use configuration.code_manager
      success = push build

      create_release if success.all?
    end

    private

    def build
      Builder.new(name, from, configuration).build
    end

    def push(changelog)
      push.map do |type|
        Push.use type
        Push.run
      end
    end

    def from
      latest_release.try(:created_at)
    end

    def latest_release
      @latest_release ||= CodeManager.latest_release name, configuration.oauth_token
    end

    def create_release
      if configuration.create_release
        CodeManager.create_release name, configuration.oauth_token
      end
    end

    def check_required_configuration!
    end

  end
end

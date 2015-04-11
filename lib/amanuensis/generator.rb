module Amanuensis
  class Generator

    def run!
      valid_configurations!

      CodeManager.use Amanuensis.code_manager.to_sym
      Tracker.use     Amanuensis.tracker.to_sym

      changelog = build_changelog
      result    = push_changelog(changelog)

      create_release if result.all?
    end

    private

    def verbose(message, &block)
      if Amanuensis.verbose
        logger.call message, block
      else
        block.call
      end
    end

    def logger
      @logger ||= Logger.new
    end

    def build_changelog
      verbose "Build changelog for #{version}" do
        Builder.new(version, latest_release.created_at).build
      end
    end

    def push_changelog(changelog)
      Amanuensis.push.map do |type|
        Push.use type.to_sym

        verbose "Push on #{type}" do
          Push.run changelog
        end
      end
    end

    def latest_release
      @latest_release ||= CodeManager.latest_release
    end

    def create_release
      verbose 'Createrelease' do
        CodeManager.create_release version
      end
    end

    def valid_configurations!
      verbose 'Valid configuration' do
        Amanuensis.valid!

        push.map(&:valid!)
        tracker.valid!
        code_manager.valid!
      end
    end

    def version
      @version = Version.new(latest_release.tag).get
    end

    def push
      @push ||= Amanuensis.push.map(&method(:classify))
    end

    def tracker
      @tracker ||= classify Amanuensis.tracker
    end

    def code_manager
      @code_manager ||= classify Amanuensis.code_manager
    end

    def classify(integration)
      "Amanuensis::#{integration.to_s.classify}".constantize
    end

  end
end

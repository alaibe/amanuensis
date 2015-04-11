module Amanuensis
  class Generator < Struct.new

    def run!
      valid_configurations!

      CodeManager.use code_manager.to_sym
      Tracker.use     tracker.to_sym

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
      push.map do |type|
        Push.use type.to_sym
        verbose "Push on #{type}" do
          Push.run changelog
        end
      end
    end

    def latest_release
      @latest_release ||= CodeManager.latest_release rescue nil
    end

    def create_release
      verbose 'Create release' do
        CodeManager.create_release version
      end
    end

    def valid_configurations!
      verbose 'Valid configuration' do
        Amanuensis.valid!

        push.each do |type|
          configurations[type.to_sym].valid!
        end

        configurations[tracker.to_sym].valid!
        configurations[code_manager.to_sym].valid!
      end
    end

    def version
      @version = Version.new(latest_release.tag).get
    end

    def push
      @push ||= Amanuensis.push
    end

    def tracker
      @tracker ||= Amanuensis.tracker
    end

    def code_manager
      @code_manager ||= Amanuensis.code_manager
    end

  end
end

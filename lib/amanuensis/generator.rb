module Amanuensis
  class Generator < Struct.new(:configurations)

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
      if configurations[:global].verbose
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
        Builder.new(version, from, configurations[tracker]).build
      end
    end

    def push_changelog(changelog)
      push.map do |type|
        Push.use type.to_sym
        verbose "Push on #{type}" do
          Push.run changelog, configurations[type.to_sym]
        end
      end
    end

    def from
      latest_release.created_at
    end

    def latest_release
      @latest_release ||= CodeManager.latest_release configurations[code_manager] rescue nil
    end

    def create_release
      verbose 'Create release' do
        CodeManager.create_release version, configurations[code_manager]
      end
    end

    def valid_configurations!
      verbose 'Valid configuration' do
        configurations[:global].valid!

        push.each do |type|
          configurations[type.to_sym].valid!
        end

        configurations[tracker.to_sym].valid!
        configurations[code_manager.to_sym].valid!
      end
    end

    def version
      @version = Version.new(latest_release, configurations[:global]).get
    end

    def push
      @push ||= configurations[:global].push
    end

    def tracker
      @tracker ||= configurations[:global].tracker
    end

    def code_manager
      @code_manager ||= configurations[:global].code_manager
    end

  end
end

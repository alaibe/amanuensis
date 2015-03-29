module Amanuensis
  class Generator < Struct.new(:name, :configurations)

    def run!
      valid_configurations!

      CodeManager.use code_manager
      Tracker.use     tracker

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
      verbose 'Build changelog' do
        Builder.new(name, version, from, configurations[tracker]).build
      end
    end

    def push_changelog(changelog)
      push.each do |type|
        Push.use type
        verbose "Push on #{type}" do
          Push.run changelog, configurations[type]
        end
      end
    end

    def from
      latest_release.created_at rescue Date.new(1900)
    end

    def latest_release
      @latest_release ||= CodeManager.latest_release name, configurations[code_manager]
    end

    def create_release
      verbose 'Create release' do
        CodeManager.create_release name, version, configurations[code_manager]
      end
    end

    def valid_configurations!
      verbose 'Valid configuration' do
        configurations[:global].valid!

        if push.include? :file
          configurations[:file].valid!
        end

        if push.include? :mail
          configurations[:mail].valid!
        end

        if [code_manager, tracker].include? :github
          configurations[:github].valid!
        end
      end
    end

    def version
      @version ||= configurations[:global].version || version_from_latest_release
    end

    def version_from_latest_release

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

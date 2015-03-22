module Amanuensis
  class Builder < Struct.new(:name, :from, :configuration)

    def build
      Tracker.use configuration.tracker
    end

    private

    def issues
      Tracker.issues(name, configuration.oauth_token, from)
    end

    def pulls
      Tracker.pulls(name, configuration.oauth_token, from)
    end

  end
end

module Amanuensis
  class Builder < Struct.new(:name, :version, :from, :configuration)

    def build
      Tracker.use configuration.tracker

      changelog = "## #{version}-#{Time.now.strftime('%Y%m%d%H%M%S')}\n"
      changelog << "**Issues closed:**\n"

      changelog << "**Pull requests closed:**\n"
      issues.each do |issue|
        changelog << "- [##{issue.number}](#{issue.html_url}) #{issue.title}\n"
      end

      pulls.each do |pull|
        changelog << "- [##{pull.number}](#{pull.html_url}) #{pull.title}\n"
      end

      changelog
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

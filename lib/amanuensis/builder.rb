module Amanuensis
  class Builder < Struct.new(:name, :version, :from, :configuration)

    def build
      Tracker.use configuration.tracker

      changelog = "## #{version}-#{Time.now.strftime('%Y%m%d%H%M%S')}"
      changelog << "**Issues closed:**"

      changelog << "**Pull requests closed:**"
      issues.each do |issue|
        changelog << "- [##{issue.number}](#{issue.html_url}) #{issue.title}"
      end

      pulls.each do |pull|
        changelog << "- [##{pull.number}](#{pull.html_url}) #{pull.title}"
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

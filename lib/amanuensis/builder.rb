module Amanuensis
  class Builder < Struct.new(:repo, :version, :from, :configuration)

    def build
      changelog = "## #{version}-#{Time.now.strftime('%d/%m/%Y %H:%M:%S')}\n"
      changelog << "\n"

      changelog << "**Issues closed:**\n"
      issues.each do |issue|
        changelog << "* [##{issue.number}](#{issue.html_url}) #{issue.title}\n"
      end

      changelog << "\n"
      changelog << "**Pull requests closed:**\n"
      pulls.each do |pull|
        changelog << "* [##{pull.number}](#{pull.html_url}) #{pull.title}\n"
      end

      changelog << "\n"
      changelog
    end

    private

    def issues
      Tracker.issues(repo, configuration.oauth_token, from)
    end

    def pulls
      Tracker.pulls(repo, configuration.oauth_token, from)
    end

  end
end

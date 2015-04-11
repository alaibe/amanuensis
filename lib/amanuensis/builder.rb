module Amanuensis
  class Builder < Struct.new(:version, :from)

    def build
      add_header
      add_issues if issues.any?
      add_pulls if pulls.any?

      changelog
    end

    private

    def changelog
      @changelog ||= ''
    end

    def add_header
      changelog << "## #{version}-#{Time.now.strftime('%d/%m/%Y %H:%M:%S')}\n"
      changelog << "\n"
    end

    def add_issues
      changelog << "**Issues closed:**\n"

      issues.each do |issue|
        changelog << "* [##{issue.number}](#{issue.html_url}) #{issue.title}\n"
      end

      changelog << "\n"
    end

    def add_pulls
      changelog << "**Pull requests closed:**\n"

      pulls.each do |pull|
        changelog << "* [##{pull.number}](#{pull.html_url}) #{pull.title}\n"
      end

      changelog << "\n"
    end

    def issues
      @issues ||= Tracker.issues(from)
    end

    def pulls
      @pulls ||= CodeManager.pulls(from)
    end

  end
end

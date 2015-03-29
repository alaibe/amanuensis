module Amanuensis
  class GlobalConfigurationError < StandardError

    def message
      'We need at least one push strategy, one code manager and one tracker'
    end

  end

  class GlobalConfigurationVersionError < StandardError

    def message
      'The version must be major, minor or patch'
    end

  end

  class GithubConfigurationError < StandardError

    def message
      'The oauth token can\'t be blank or nil'
    end

  end

  class FileConfigurationError < StandardError

    def message
      'The file name can\'t be blank or nil'
    end

  end

  class MailConfigurationError < StandardError

    def message
      'The pony configuration is required'
    end

  end
end

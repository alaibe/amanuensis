module Amanuensis
  VERSION = "0.0.1"

  class Version < Struct.new(:release, :configuration)

    def get
      major, minor, patch = *previous

      case configuration.version.to_sym
      when :minor
        minor += 1
      when :major
        major += 1
      when :patch
        patch += 1
      end

      [major, minor, patch].join '.'
    end

    def previous
      return [0, 0, 0] if release.nil?
    end

  end
end

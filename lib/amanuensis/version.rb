module Amanuensis
  VERSION = "1.0.0"

  class Version < Struct.new(:tag)

    def get
      major, minor, patch = *previous

      case Amanuensis.version.to_sym
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
      tag.split('.').map(&:to_i)
    end

  end
end

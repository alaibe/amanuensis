module Amanuensis
  class Push
    class File

      FILE_NAME = 'Changelog.md'

      def run(changelog)
        if ::File.exists?(FILE_NAME)
          ::File.open(FILE_NAME, 'r') do |orig|
            ::File.unlink(FILE_NAME)
            ::File.open(FILE_NAME, 'w') do |new|
              new.write changelog
              new.write orig.read
            end
          end
        else
          f = ::File.new('Changelog.md', 'w')
          f.write changelog
          f.close
        end
      end

    end
  end
end

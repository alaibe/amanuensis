module Amanuensis
  class Push
    class File

      FILE_NAME = 'Changelog.md'

      def run(changelog)
        if ::File.exists?(FILE_NAME)
          prepend(changelog)
        else
          create(changelog)
        end
      end

      private

      def create(changelog)
        f = ::File.new(FILE_NAME, 'w')
        f.write changelog
        f.close
      end

      def prepend(changelog)
        ::File.open(FILE_NAME, 'r') do |orig|
          ::File.unlink(FILE_NAME)
          ::File.open(FILE_NAME, 'w') do |new|
            new.write changelog
            new.write orig.read
          end
        end
      end

    end
  end
end

module Amanuensis
  module File
    class Push

      def run(changelog)
        if ::File.exists?(file_name)
          prepend(changelog)
        else
          create(changelog)
        end
      end

      private

      def file_name
        @file_name ||= File.file_name
      end

      def create(changelog)
        f = ::File.new(file_name, 'w')
        f.write changelog
        f.close
      end

      def prepend(changelog)
        ::File.open(file_name, 'r') do |orig|
          ::File.unlink(file_name)
          ::File.open(file_name, 'w') do |new|
            new.write changelog
            new.write orig.read
          end
        end
      end

    end
  end
end

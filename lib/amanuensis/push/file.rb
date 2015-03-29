module Amanuensis
  class Push
    class File

      def run(changelog, configuration)
        file_name = configuration.file_name
        if ::File.exists?(file_name)
          prepend(changelog, file_name)
        else
          create(changelog. file_name)
        end
      end

      private

      def create(changelog, file_name)
        f = ::File.new(file_name, 'w')
        f.write changelog
        f.close
      end

      def prepend(changelog, file_name)
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

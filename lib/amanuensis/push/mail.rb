module Amanuensis
  class Push
    class Mail

      def run(changelog, configuration)
        Pony.mail(configuration.pony)
      end

    end

  end
end

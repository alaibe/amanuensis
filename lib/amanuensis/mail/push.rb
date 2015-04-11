module Amanuensis
  class Push
    class Mail

      def run(changelog, configuration)
        Pony.mail(configuration.pony.merge({ body: changelog }))
      end

    end

  end
end

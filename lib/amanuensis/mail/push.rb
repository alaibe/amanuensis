module Amanuensis
  module Mail
    class Push

      def run(changelog)
        Pony.mail(configuration.pony.merge({ body: changelog }))
      end

    end

  end
end

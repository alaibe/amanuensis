module Amanuensis
  module Mail
    class Push

      def run(changelog)
        Pony.mail Mail.pony.merge(body: changelog)
      end

    end

  end
end

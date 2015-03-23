module Amanuensis
  class Push
    class Mail

      def run(changelog)
        Mailer.push(changelog).deliver!
      end

    end

    class Mailer < ActionMailer::Base

      def push(changelog)
        mail(subject: "[Release] amanuensis") do |format|
          render text: changelog
        end
      end

    end
  end
end

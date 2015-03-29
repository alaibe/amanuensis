module Amanuensis
  class Push
    class Mail

      def run(changelog)
        Pony.mail({
          :to => 'you@example.com',
          :from => 'me@example.com',
          :subject => 'hi',
          :body => 'Hello there.'
        })
      end

    end

  end
end

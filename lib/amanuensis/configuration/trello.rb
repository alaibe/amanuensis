module Amanuensis
  class Configuration
    class Trello

      attr_accessor :list, :key, :token, :board

      def valid!
        raise TrelloConfigurationError if list.blank? || key.blank? || token.blank? || board.blank?
      end

    end
  end
end

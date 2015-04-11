module Amanuensis
  module Trello
    class Tracker

      def issues(from)
        configure!
        list = board.lists.find { |list| list.name == Trello.list }

        list.cards.select do |card|
          card.last_activity_date > from.to_time
        end.map do |card|
          Issue.new card.short_id, card.short_url, card.name
        end
      end

      private

      def configure!
        ::Trello.configure do |config|
          config.developer_public_key = Amanuensis::Trello.config['key']
          config.member_token         = Amanuensis::Trello.token
        end
      end

      def board
        @board ||= ::Trello::Board.all.find { |board| board.name == Trello.board }
      end

    end
  end
end

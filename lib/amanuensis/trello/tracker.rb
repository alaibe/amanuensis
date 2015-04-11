module Amanuensis
  class Tracker
    class Trello

      def issues(from)
        ::Trello.configure do |config|
          config.developer_public_key = configuration.key
          config.member_token = configuration.token
        end
        board = ::Trello::Board.all.find { |board| board.name == configuration.board }
        list  = board.lists.find { |list| list.name == configuration.list }

        list.cards.select do |card|
          card.last_activity_date > from.to_time
        end.map do |card|
          Issue.new card.short_id, card.short_url, card.name
        end
      end

    end
  end
end

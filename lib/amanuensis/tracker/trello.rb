module Amanuensis
  class Tracker
    class Trello

      def issues(from, configuration)
        client = Trello.new developer_public_key: configuration.key, member_token: configuration.token
        board  = client.find(:boards, configuration.board)

        board.cards
      end

    end

    def pulls(_, _)
      []
    end

  end
end

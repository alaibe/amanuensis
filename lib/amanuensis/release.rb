module Amanuensis
  class Release < Struct.new(:name, :oauth_token)

    def latest
      client.latest_release(name)
    end

    def create
    end

    private


  end
end

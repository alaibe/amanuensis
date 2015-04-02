module Amanuensis
  class CodeManager
    extend Interchange.new(:latest_release, :create_release)

    Release = Struct.new(:created_at, :tag)
  end
end

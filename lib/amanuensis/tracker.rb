module Amanuensis
  class Tracker
    extend Interchange.new(:issues, :pulls)
  end
end

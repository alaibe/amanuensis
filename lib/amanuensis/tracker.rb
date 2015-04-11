module Amanuensis
  class Tracker
    extend Interchange.new(:issues)

    Issue = Struct.new(:number, :html_url, :title)
  end
end

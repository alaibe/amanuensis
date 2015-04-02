module Amanuensis
  class Tracker
    extend Interchange.new(:issues, :pulls)

    Issue = Struct.new(:number, :html_url, :title)
    Pull  = Struct.new(:number, :html_url, :title)
  end
end

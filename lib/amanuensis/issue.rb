module Amanuensis
  class Issue < Struct.new(:number, :html_url, :title)
  end
end

module Amanuensis
  class CodeManager
    extend Interchange.new(:latest_release, :create_release, :pulls)

    Release = Struct.new(:created_at, :tag)
    Pull    = Struct.new(:number, :html_url, :title)
  end
end

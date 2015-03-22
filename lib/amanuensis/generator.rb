module Amanuensis
  class Generator < Struct.new(:name, :configuration)

    def run!
      check_required_configuration!

      push build

      create_release
    end

    private

    def build
      Builder.new(name, configuration).build
    end

    def push(changelog)
    end

    def create_release
    end

    def check_required_configuration!
    end

  end
end

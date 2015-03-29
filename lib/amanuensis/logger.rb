require 'benchmark'

module Amanuensis
  class Logger

    def call(message, block)
      puts "#{message}"

      duration = Benchmark.realtime do
        block.call
      end

      puts "#{message} ends after #{duration}s"
    end

  end
end

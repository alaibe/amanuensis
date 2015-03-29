require 'benchmark'

module Amanuensis
  class Logger

    def call(message, block)
      puts "#{message}"
      result = nil

      duration = Benchmark.realtime do
        result = block.call
      end

      puts "#{message} ends after #{duration}s"

      result
    end

  end
end

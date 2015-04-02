require 'benchmark'

module Amanuensis
  class Logger

    def call(message, block)
      formatter.info "#{message}"
      result = nil

      duration = Benchmark.realtime do
        result = block.call
      end

      formatter.info "#{message} ends after #{duration}s"

      result
    end

    private

    def formatter
      @formatter ||= ::Logger.new(STDOUT)
    end

  end
end

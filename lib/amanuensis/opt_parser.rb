require 'optparse'
require 'ostruct'

module Amanuensis
  class OptParser

    def self.parse(args)
      options = OpenStruct.new

      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: amanuensis name [options]"

        opts.separator ""
        opts.separator "Specific options:"

        opts.on("-t", "--tracker [STRING]", [:github], "Your tracker system") do |tracker|
          options.tracker = tracker
        end


        opts.on("-o", "--outputs [ARRAY]", [:mail, :file], "The way you want the results") do |outputs|
          options.outputs = outputs
        end

        opts.separator ""
        opts.separator "Common options:"

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end
      end

      opt_parser.parse!(args)
      options
    end

  end
end

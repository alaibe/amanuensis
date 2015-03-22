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

        opts.on("-t", "--tracker default: github, [STRING]", [:github], "Your tracker system") do |tracker|
          options.tracker = tracker
        end

        opts.on("-p", "--push default: file, [ARRAY]", [:mail, :file], "The way you want the results") do |push|
          options.push = push
        end

        opts.on("-c", "--code-manager default: github, [STRING]", [:github], "Where the code is stored") do |code_manager|
          options.code_manager = code_manager
        end

        opts.on("-o", "--oauth-token, [STRING]", Sting, "Oauth token of your code manger") do |code_manager|
          options.code_manager = code_manager
        end

        opts.on("-r", "--release default: false, [Boolean]", Boolean, "Create a release at the end") do |release|
          options.create_release = release
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

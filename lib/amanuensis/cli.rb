module Amanuensis
  class CLI < Thor

    desc "generate <repo>", "Generate a changelog for the repo and to the version specified"
    option :push,         type: :array,   aliases: :p, default: [:file]
    option :tracker,      type: :string,  aliases: :t, default: :github
    option :code_manager, type: :string,  aliases: :c, default: :github
    option :version,      type: :string,  aliases: :u, default: :patch
    option :verbose,      type: :boolean, aliases: :v, default: false
    option :github,       type: :hash,    aliases: :g
    option :mail,         type: :hash,    aliases: :m
    option :file,         type: :hash,    aliases: :f
    def generate(name)
      Amanuensis.configure do |config|
        config.push         = options.push
        config.tracker      = options.tracker
        config.code_manager = options.code_manager
        config.version      = options.version
        config.verbose      = options.verbose
      end

      Amanuensis.configure :github do |config|
        break if options.github.blank?

        options.github.each do |key, value|
          config.send "#{key}=", value
        end
      end

      Amanuensis.configure :file do |config|
        break if options.file.blank?

        options.file.each do |key, value|
          config.send "#{key}=", value
        end
      end

      Amanuensis.configure :mail do |config|
        break if options.mail.blank?

        config.pony = options.mail
      end

      Amanuensis.generate name
    end

  end
end

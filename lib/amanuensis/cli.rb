module Amanuensis
  class CLI < Thor

    desc "generate", "Generate a changelog"
    option :push,         type: :array,   aliases: :p, default: [:file]
    option :tracker,      type: :string,  aliases: :t, default: :github
    option :code_manager, type: :string,  aliases: :c, default: :github
    option :version,      type: :string,  aliases: :u, default: :patch
    option :verbose,      type: :boolean, aliases: :v, default: false
    option :github,       type: :hash,    aliases: :g
    option :trello,       type: :hash,    aliases: :c
    option :pivotal,      type: :hash,    aliases: :i
    option :mail,         type: :hash,    aliases: :m
    option :file,         type: :hash,    aliases: :f
    def generate
      Amanuensis.push         = options.push
      Amanuensis.tracker      = options.tracker
      Amanuensis.code_manager = options.code_manager
      Amanuensis.version      = options.version
      Amanuensis.verbose      = options.verbose

      if options.github.present?
        options.github.each do |key, value|
          Amanuensis::Github.send "#{key}=", value
        end
      end

      if options.file.present?
        options.file.each do |key, value|
          Amanuensis::File.send "#{key}=", value
        end
      end

      if options.trello.present?
        options.trello.each do |key, value|
          Amanuensis::Trello.send "#{key}=", value
        end
      end

      if options.pivotal.present?
        options.pivotal.each do |key, value|
          Amanuensis::Pivotal.send "#{key}=", value
        end
      end

      Amanuensis::Mail.pony  = options.mail

      Amanuensis.generate
    rescue ValidationError => e
      puts e.message
    end

  end
end

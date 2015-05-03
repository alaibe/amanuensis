module Amanuensis
  class CLI < Thor

    desc "generate", "Generate a changelog"
    option :push,         type: :array,   aliases: :p, default: [:file]
    option :tracker,      type: :string,  aliases: :t, default: :github
    option :code_manager, type: :string,  aliases: :c, default: :github
    option :version,      type: :string,  aliases: :u, default: :patch
    option :release,      type: :boolean, aliases: :r, default: true
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
      Amanuensis.release      = options.release

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

      if options.mail.present?
        pony = extract_pony_options!(options.mail)
        Amanuensis::Mail.pony = pony
      end

      Amanuensis.generate
    rescue ValidationError => e
      puts e.message
    end

    private

    VIA_OPTIONS = 'via_options'

    def extract_pony_options!(options = {})
      via_options = options[VIA_OPTIONS] ||= {}

      options.each do |key, value|
        if key != VIA_OPTIONS && key.start_with?(VIA_OPTIONS)
          sub_key = key.gsub("#{VIA_OPTIONS}_", '')
          via_options[sub_key.to_sym] = value
          options.delete(key)
        end
      end

      string_keys_to_symbols(options)
    end

    def string_keys_to_symbols(hash)
      hash.inject({}){ |memo,(key, value)|
        memo[key.to_sym] = value
        memo
      }
    end

  end
end

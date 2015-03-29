module Amanuensis
  class CLI < Thor

    desc "generate REPO VERSION", "Generate a changelog for the repo and to the version specified"
    option :push,         type: :array,  default: [:file]
    option :tracker,      type: :string, default: :github
    option :code_manager, type: :string, default: :github
    option :github,       type: :hash
    option :mail,         type: :hash
    option :file,         type: :hash
    def generate(name, version)
      Amanuensis.configure do |config|
        config.push           = options.push
        config.tracker        = options.tracker
        config.code_manager   = options.code_manager
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

      Amanuensis.generate name, version
    end

  end
end

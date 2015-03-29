module Amanuensis
  class CLI < Thor

    desc "generate REPO VERSION", "Generate a changelog for the repo and to the version specified"
    option :push,           type:     :array, default: [:file]
    option :tracker,        default:  :github
    option :code_manager,   default:  :github
    def generate(name, version)
      Amanuensis.configure do |config|
        config.push           = options.push
        config.tracker        = options.tracker
        config.code_manager   = options.code_manager
      end

      Amanuensis.generate name, version
    end

  end
end

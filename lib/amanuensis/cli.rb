module Amanuensis
  class CLI < Thor

    desc "generate REPO VERSION", "Generate a changelog for the repo and to the version specified"
    option :push,           type:     :array, default: [:file]
    option :tracker,        default:  :github
    option :code_manager,   default:  :github
    option :oauth_token,    required: true
    option :create_release, type:     :boolean, default: false
    def generate(name, version)
      Amanuensis.configure do |config|
        config.push           = options.push
        config.tracker        = options.tracker
        config.code_manager   = options.code_manager
        config.oauth_token    = options.oauth_token
        config.create_release = options.create_releaso
      end

      Amanuensis.generate name, version
    end
    alias_method :g, :generate

  end
end

module Amanuensis
  class CLI < Thor

    desc "generate", "Generate a changelog"
    option :push,         type: :array,   aliases: :p, default: [:file]
    option :tracker,      type: :string,  aliases: :t, default: :github
    option :code_manager, type: :string,  aliases: :c, default: :github
    option :version,      type: :string,  aliases: :u, default: :patch
    option :verbose,      type: :boolean, aliases: :v, default: false
    option :github,       type: :hash,    aliases: :g
    option :bitbucket,    type: :hash,    aliases: :b
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

      Amanuensis::Github.config  = options.github
      Amanuensis::File.config    = options.file
      Amanuensis::Mail.config    = options.mail
      Amanuensis::Trello.config  = options.trello
      Amanuensis::Pivotal.config = options.pivotal

      Amanuensis.generate
    rescue GlobalConfigurationVersionError, GlobalConfigurationError,
      GithubConfigurationError,
      TrelloConfigurationError, PivotalConfigurationError,
      FileConfigurationError, MailConfigurationError => e
      puts e.message
    end

  end
end

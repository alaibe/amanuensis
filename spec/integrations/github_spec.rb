require 'spec_helper'

describe 'Github Amanuensis' do

  it 'Generates a github changelog and release' do
    Amanuensis.configure do |config|
      config.push         = [:github]
      config.code_manager = :github
      config.tracker      = :github
    end

    Amanuensis.configure :github do |config|
      config.oauth_token  = ENV.fetch('GITHUB_OAUTH_TOKEN')
      config.repo         = ENV.fetch('GITHUB_REPO')
    end

    Amanuensis.generate
  end

end

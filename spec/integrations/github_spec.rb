require 'spec_helper'

describe 'Github Amanuensis' do

  it 'Generates a github changelog and release' do
    Amanuensis.push         = [:github]
    Amanuensis.code_manager = :github
    Amanuensis.tracker      = :github

    Amanuensis::Github.oauth_token = ENV.fetch('GITHUB_OAUTH_TOKEN')
    Amanuensis::Github.repo        = ENV.fetch('GITHUB_REPO')

    Amanuensis.generate
  end

end

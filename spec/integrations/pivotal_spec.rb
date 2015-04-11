require 'spec_helper'

describe 'Pivotal Amanuensis' do

  it 'Generates a changelog from pivotal tracker' do
    Amanuensis.configure do |config|
      config.push         = [:fake]
      config.code_manager = :fake
      config.tracker      = :pivotal
    end

    Amanuensis.configure :pivotal do |config|
      config.token   = ENV.fetch('PIVOTAL_TOKEN')
      config.project = ENV.fetch('PIVOTAL_PROJECT')
    end

    Amanuensis.generate
  end

end

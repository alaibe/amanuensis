require 'spec_helper'

describe 'Fake Amanuensis' do

  it 'Generates a fake changelog and release' do
    Amanuensis.configure do |config|
      config.push         = [:fake]
      config.code_manager = :fake
      config.tracker      = :fake
    end

    Amanuensis.generate
  end

end

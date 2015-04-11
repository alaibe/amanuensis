require 'spec_helper'

describe 'Fake Amanuensis' do

  it 'Generates a fake changelog and release' do
    Amanuensis.push         = [:fake]
    Amanuensis.code_manager = :fake
    Amanuensis.tracker      = :fake

    Amanuensis.generate
  end

end

require 'spec_helper'

describe 'Pivotal Amanuensis' do

  it 'Generates a changelog from pivotal tracker' do
    Amanuensis.push         = [:fake]
    Amanuensis.code_manager = :fake
    Amanuensis.tracker      = :pivotal

    Amanuensis::Pivotal.token   = ENV.fetch('PIVOTAL_TOKEN')
    Amanuensis::Pivotal.project = ENV.fetch('PIVOTAL_PROJECT')

    Amanuensis.generate
  end

end

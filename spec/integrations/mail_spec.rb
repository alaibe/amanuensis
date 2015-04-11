require 'spec_helper'

describe 'Mail Amanuensis' do

  it 'Generates a changelog and send it via mail' do
    Amanuensis.push         = [:mail]
    Amanuensis.code_manager = :fake
    Amanuensis.tracker      = :fake

    Amanuensis::Mail.pony = { to: 'foo@bar.com' }

    expect(Pony).to receive(:mail)
    Amanuensis.generate
  end

end

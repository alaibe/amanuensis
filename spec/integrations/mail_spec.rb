require 'spec_helper'

describe 'Mail Amanuensis' do

  it 'Generates a changelog and send it via mail' do
    Amanuensis.configure do |config|
      config.push         = [:mail]
      config.code_manager = :fake
      config.tracker      = :fake
    end

    Amanuensis.configure :mail do |config|
      config.pony = { to: 'foo@bar.com' }
    end

    expect(Pony).to receive(:mail)
    Amanuensis.generate
  end

end

require 'spec_helper'

describe 'File Amanuensis' do

  it 'Generates a file changelog' do
    Amanuensis.configure do |config|
      config.push         = [:file]
      config.code_manager = :fake
      config.tracker      = :fake
    end

    Amanuensis.generate

    contents = File.read('./Changelog.md')

    expect(contents).to include 'Issues closed'
    expect(contents).to include 'Pull requests closed'

    File.unlink('./Changelog.md')
  end

end

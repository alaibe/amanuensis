require 'spec_helper'

describe 'File Amanuensis' do

  it 'Generates a file changelog' do
    Amanuensis.push         = [:file]
    Amanuensis.code_manager = :fake
    Amanuensis.tracker      = :fake

    Amanuensis.generate

    contents = File.read('./Changelog.md')

    expect(contents).to include 'Issues closed'
    expect(contents).to include 'Pull requests closed'

    File.unlink('./Changelog.md')
  end

end

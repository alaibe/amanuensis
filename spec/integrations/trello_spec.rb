require 'spec_helper'

describe 'Trello Amanuensis' do

  it 'Generates a changelog from trello tracker' do
    Amanuensis.configure do |config|
      config.push         = [:fake]
      config.code_manager = :fake
      config.tracker      = :trello
    end

    Amanuensis.configure :trello do |config|
      config.key   = ENV.fetch('TRELLO_KEY')
      config.token = ENV.fetch('TRELLO_TOKEN')
      config.board = ENV.fetch('TRELLO_BOARD')
      config.list  = ENV.fetch('TRELLO_LIST')
    end

    Amanuensis.generate
  end

end

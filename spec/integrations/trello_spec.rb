require 'spec_helper'

describe 'Trello Amanuensis' do

  it 'Generates a changelog from trello tracker' do
    Amanuensis.push         = [:fake]
    Amanuensis.code_manager = :fake
    Amanuensis.tracker      = :trello

    Amanuensis::Trello.key   = ENV.fetch('TRELLO_KEY')
    Amanuensis::Trello.token = ENV.fetch('TRELLO_TOKEN')
    Amanuensis::Trello.board = ENV.fetch('TRELLO_BOARD')
    Amanuensis::Trello.list  = ENV.fetch('TRELLO_LIST')

    Amanuensis.generate
  end

end

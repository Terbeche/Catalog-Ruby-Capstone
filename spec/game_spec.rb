require './game_author/game'

describe Game do
  before :each do
    @game = Game.new(2, '2022-09-05', '2022-09-05', false, 'Natnael Demelash')
  end
  it 'returns the correct last played at' do
    expect(@game.last_played_at).to eq '2022-09-05'
  end
  it 'returns the correct publish date' do
    expect(@game.publish_date).to eq '2022-09-05'
  end
  it 'returns the correct archived status' do
    expect(@game.archived).to be false
  end
end

require './game_author/author'

describe Author do
  author = Author.new('Natnael', 'Demelash')
  it 'returns the correct first name' do
    expect(author.first_name).to eq 'Natnael'
  end
  it 'returns the correct last name' do
    expect(author.last_name).to eq 'Demelash'
  end
end

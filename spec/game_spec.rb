require_relative '../game_author/game'


describe Author do
  author = Author.new('Natnael', 'Demelash')
  it `returns the correct first name` do
    expect(author.first_name).to include 'Natnael'
  end
  it `returns the correct last name` do
    expect(author.last_name).to include 'Demelash'
  end
end
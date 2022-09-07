require 'json'

module SaveData
  def save_game(game)
    File.write('./game.json', JSON.generate(game))
  end

  def save_author(author)
    File.write('./author.json', JSON.generate(author))
  end
end

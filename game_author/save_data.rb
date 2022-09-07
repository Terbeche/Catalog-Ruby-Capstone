require 'json'

module SaveData
  def save_game(game)
    File.write('./game.json', JSON.generate(game))
  end
end

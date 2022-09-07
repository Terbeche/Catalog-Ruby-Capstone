module LoadData
  def load_games
    saved_rentals = open('./game.json')
    save = saved_rentals.read
    JSON.parse(save)
  end
end

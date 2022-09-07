module LoadData
  def load_games
    if File.exist?('./game.json')
     saved_games = open('./game.json')
     save = saved_games.read
     JSON.parse(save)
    else
        File.write('./game.json', '[]')
    end
  end
  def load_authors
    if File.exist?('./author.json')
     saved_authors = open('./author.json')
     save = saved_authors.read
     JSON.parse(save)
    else
        File.write('./author.json', '[]')
    end
  end
end

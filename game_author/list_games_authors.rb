module ListGameAndAuthor
  def list_authors
    puts 'There are no Authors' if @author.empty?
    puts 'Authors:'
    @author.each do |author|
      puts "#{@author.index(author)}, #{author['first_name']} #{author['last_name']}"
    end

    puts ''
    run
  end

  def list_games
    puts 'There are no Games' if @game.empty?
    @game.each do |game|
      puts "Author: #{game['author']} Game Publish Date: #{game['publish_date']}
      Last Played at: #{game['last_played_at']} Archive Status: #{game['archived']}
      Multiplayer: #{game['multiplayer']}"
    end

    puts ''
    run
  end
end

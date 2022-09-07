require_relative 'game'
require_relative 'save_data'

module AddGame
  include SaveData
  def add_game
    print 'published Date: '
    published_date = gets.chomp.to_i

    print 'is Archived [Y/N]: '
    archived = ''
    case gets.chomp.downcase
    when 'y'
      archived = true

    when 'n'
      archived = false
    else
      puts('please enter [Y/N]: ')
    end

    print 'Multiplayer: '
    multiplayer = gets.chomp

    print 'last played at: '
    last_played_at = gets.chomp.to_i

    print 'Author First Name: '
    first_name = gets.chomp

    print 'Author Last Name: '
    last_name = gets.chomp

    create_game(published_date, archived, multiplayer, last_played_at, first_name, last_name)
    run
  end

  def create_game(publish_date, archived, multiplayer, last_played_at, first_name, last_name)
    create_author(first_name, last_name)
    new_author = first_name + ' ' + last_name
    new_game = Game.new(multiplayer, last_played_at, publish_date, archived, new_author)
    save_to_json(new_game)
  end

  def save_to_json(game)
    @game << { 'publish_date' => game.publish_date,
               'last_played_at' => game.last_played_at,
               'archived' => game.archived,
               'author' => game.author,
               'multiplayer' => game.multiplayer }

    save_game(@game)
  end

  def create_author(first_name, last_name)
    new_author = Author.new(first_name, last_name)
    @author << new_author
  end
end

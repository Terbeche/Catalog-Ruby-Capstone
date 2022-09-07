require_relative 'list_games_authors'
require_relative 'add_game'
require_relative 'author'
require_relative 'load_data'
require_relative 'save_data'

class App
  include ListGameAndAuthor
  include AddGame
  include LoadData
  include SaveData

  def initialize
    @game = load_games
    @items = []
    @author = load_authors
  end

  def options
    puts('1 - List all Games')
    puts('2 - List all Authors')
    puts('3 - Add a game')
    puts('4 - exit')
    puts('')
  end

  def display
    options
  end

  def run_choise(input)
    case input
    when '1'
      list_games
    when '2'
      list_authors
    when '3'
      add_game
    else
      exit
    end
  end

  def run
    options
    puts 'Enter number'
    input = gets.chomp
    run_choise(input)
  end
end

one = App.new
one.run

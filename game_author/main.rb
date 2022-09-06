require_relative 'list_games_authors'
class App
  include ListGameAndAuthor

  def initialize
    @game = []
    @author = []
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
      list_books
    when '2'
      list_people
    when '3'
      create_people
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

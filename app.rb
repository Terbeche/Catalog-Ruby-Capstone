require_relative 'movie'
require_relative 'source'
require_relative 'item'

class App

    def Initialize
        @movies = []
        @sourc = []
    end

    def show_menu
        puts "Welcome"
        puts ""
        puts "1 - List all movies"
        puts "2 - List all sources"
        puts "3 - Add a movie"

        gets.chomp
    end

    def run_command
        run = show_menu
        case run
        when '1'
          list_all_movies
        when '2'
          list_all_sources
        when '3'
          add_movie
        when '4'
          puts 'Thanks for using this app ...'
        #   SaveData.save(@my_books, @people, @my_rentals)
        #   puts 'The data have been saved.'
          exit
        else
          puts ""
          puts 'Select any option from 1 to 4'
          puts ''
          run_command
        end
      end
end
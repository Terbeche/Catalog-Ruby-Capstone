require_relative 'movie'
require_relative 'source'
require_relative 'item'

require_relative './persist_files/persist_movies'
require_relative './persist_files/persist_sources'

require_relative './modules/movie_module'
require_relative './modules/source_module'

class App

    def Initialize
        @movies = load_movies
        @sources = load_sources
    end

    include moviesPersistence
  include sourcesPersistence
  include movieModule
  include sourceModule

    def show_menu
        puts "Welcome"
        puts ""
        puts "1 - List all movies"
        puts "2 - List all sources"
        puts "3 - Add a movie"
        puts "4 - Exit app"

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
          store_movies(@movies)
          store_sources(@sources)
          puts 'The data have been saved.'
          exit
        else
          puts ""
          puts 'Select any option from 1 to 4'
          puts ''
          run_command
        end
    end

    # def add_source
    #     print 'name:'
    #     name = gets.chomp
    #     source = Source.new(name)
    #     @source.push(source)
    #     puts 'source added successfully'
    #     puts ''
    #     run_command
    # end

    # def add_movie
    #   print 'Name:'
    #   name = gets.chomp
    #   print 'Silent:'
    #   silent = gets.chomp
    #   print 'Date of publish(yyyy/mm/dd):'
    #   publish_date = gets.chomp
    #   movie = Movie.new(name, silent, publish_date)
    #   @movies.push(movie)
    #   puts "Movie added successfully"
    #   puts ''
    #   run_command
    # end
end
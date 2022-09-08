require_relative '../movie'
require_relative '../../item'

module MovieModule
  def list_movies
    if @movies.empty?
      puts 'There is no movies to display'
    else
      puts 'Here is the list of movies'
      puts
      @movies.each_with_index do |movie, index|
        print "#{index}) name: \"#{movie.name}\", Publish Date: \"#{movie.publish_date}\","
        print " silent: \"#{movie.silent}\",  Archived: \"#{movie.archived}\" ,  Source: \"#{movie.source_name}\""
        puts
      end
    end
  end

  def add_movie
    print 'name: '
    name = gets.chomp.strip
    print 'Is the book\'s silent is true/false ? [T/F]: '
    silent = gets.chomp.strip.upcase
    case silent
    when 'T'
      silent = 'true'
    when 'F'
      silent = 'false'
    end
    print 'Enter publish date in [yyyy-mm-dd] format: '
    publish_date = gets.chomp.strip

    puts 'Choose a source of create a new source: '
    @sources.each_with_index do |source, idx|
      puts "#{idx + 1}) #{source.name}"
    end
    puts '0) ***** Create your own source *****'
    source_choice = gets.chomp.strip.to_i
    if source_choice.zero?
      print 'Please give a source name to your movie: '
      name = gets.chomp.strip.upcase
      source = Source.new(name)
      @sources << source

    else
      name = @sources[source_choice - 1].name

    end

    movie = Movie.new(name, silent, publish_date, false, name, rand(1..1000))
    movie.move_to_archive
    @movies << movie
    unless source.nil?

      source.add_item(movie)
      movie.add_source(source)

    end

    puts 'movie created successfully'
  end
end

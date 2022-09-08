require 'json'

module MoviesPersistence
  def store_movies(movies)
    data = []
    file = 'movies/JSON_files/movies.json'
    return unless File.exist?(file)

    movies.each do |movie|
      data << { id: movie.id, name: movie.name, silent: movie.silent, publish_date: movie.publish_date,
                archived: movie.archived, source: movie.source_name }
    end
    File.write(file, JSON.generate(data))
  end

  def load_movies
    data = []
    file = 'movies/JSON_files/movies.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |movie|
      data << Movie.new(movie['id'], movie['name'], movie['silent'], movie['publish_date'], movie['archived'],
                        movie['source'])
    end

    data
  end
end

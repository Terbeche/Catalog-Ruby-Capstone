require 'json'

module GenresController
  def store_genres(genres)
    return if genres.empty?

    file = './genre/genres.json'
    File.new('./genre/genres.json', 'w+') unless File.exist?(file)
    data = []
    genres.each do |genre|
      data << {
        name: genre.name,
        id: genre.id
      }
    end
    File.write(file, JSON.generate(data))
  end

  def load_genres
    data = []
    file = './genre/genres.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |genre|
      data << Genre.new(genre['name'], genre['id'])
    end
    data
  end

  
end
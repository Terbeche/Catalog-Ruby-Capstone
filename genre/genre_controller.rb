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

 
end
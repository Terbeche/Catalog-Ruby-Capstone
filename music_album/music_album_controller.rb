require 'json'

module MusicAlbumsController
  def save_music_album(album)
    File.new('./music_album/music_albums.json', 'w+') unless File.exist?('./music_album/music_albums.json')

    if File.empty?('./music_album/music_albums.json')
      music_albums = []
    else
      data = File.read('./music_album/music_albums.json').split
      music_albums = JSON.parse(data.join)
    end

    music_albums.push({ 'id' => album.id, 'on_spotify' => album.on_spotify, 'publish_date' => album.publish_date,
                        'music_genre' => album.genre,
                        'archived' => album.archived })

    File.write('./music_album/music_albums.json', music_albums.to_json)
  end

  
end
require 'json'

require_relative '../models/music_album'
require_relative '../../../shared/repositories/disk_repository'

class DiskMusicAlbumsRepository < DiskRepository
  def initialize(
    genres_repository,
    authors_repository,
    labels_repository
  )
    @genres_repository = genres_repository
    @authors_repository = authors_repository
    @labels_repository = labels_repository
    super('./src/shared/data/music_albums.json')
  end

  private

  def parse_json(music_albums_json_data)
    music_albums_hash = JSON.parse(music_albums_json_data)
    music_albums_hash.map do |music_album_hash|
      id,
      genre_id,
      author_id,
      label_id,
      publish_date,
      archived,
      on_spotify = music_album_hash.values_at(
        'id',
        'genre_id',
        'author_id',
        'label_id',
        'publish_date',
        'archived',
        'on_spotify'
      )

      genre = @genres_repository.find_by_id(genre_id)
      author = @authors_repository.find_by_id(author_id)
      label = @labels_repository.find_by_id(label_id)

      MusicAlbum.new(
        id: id,
        genre: genre,
        author: author,
        label: label,
        on_spotify: on_spotify,
        publish_date: publish_date,
        archived: archived
      )
    end
  end
end

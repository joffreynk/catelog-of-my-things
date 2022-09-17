require_relative '../../models/music_album'

class CreateMusicAlbumService
  def initialize(
    music_albums_repository:,
    genres_repository:,
    authors_repository:,
    labels_repository:
  )
    @music_albums_repository = music_albums_repository
    @genres_repository = genres_repository
    @authors_repository = authors_repository
    @labels_repository = labels_repository
  end

  def execute(service_request)
    genre_id,
    author_id,
    label_id,
    on_spotify,
    publish_date = service_request.values_at(
      :genre_id,
      :author_id,
      :label_id,
      :on_spotify,
      :publish_date
    )
    genre = @genres_repository.find_by_id(genre_id)

    raise StandardError, "No genre with the ID #{genre_id}." unless genre

    author = @authors_repository.find_by_id(author_id)

    raise StandardError, "No author with the ID #{author_id}." unless author

    label = @labels_repository.find_by_id(label_id)

    raise StandardError, "No label with the ID #{label_id}." unless label

    new_music_album = MusicAlbum.new(
      genre: genre,
      author: author,
      label: label,
      on_spotify: on_spotify,
      publish_date: publish_date
    )
    @music_albums_repository.save(new_music_album)
    new_music_album
  end
end

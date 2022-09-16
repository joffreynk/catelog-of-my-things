require_relative '../../models/music_album'

class ListMusicAlbumsService
  def initialize(music_albums_repository)
    @music_albums_repository = music_albums_repository
  end

  def execute
    @music_albums_repository.fetch_all
  end
end

require_relative './create_music_album_service'
require_relative '../../../../shared/repositories/memory_repository'

FAKE_ON_SPOTIFY ||= true
FAKE_PUBLISH_DATE ||= '2018-10-10'
FAKE_ID ||= 1

describe CreateMusicAlbumService do
  before(:each) do
    @music_albums_repository = MemoryRepository.new
    fake_entity = double('entity')
    fake_entities_repository = double('entities_repository')

    allow(fake_entity).to receive(:add_item) { |item| item }
    allow(fake_entities_repository).to receive(:find_by_id) { |id| fake_entity }

    @create_music_album_service = CreateMusicAlbumService.new(
      music_albums_repository: @music_albums_repository,
      genres_repository: fake_entities_repository,
      authors_repository: fake_entities_repository,
      labels_repository: fake_entities_repository
    )
  end

  it 'should be able to create a new music album' do
    new_music_album = @create_music_album_service.execute(
      genre_id: FAKE_ID,
      author_id: FAKE_ID,
      label_id: FAKE_ID,
      on_spotify: FAKE_ON_SPOTIFY,
      publish_date: FAKE_PUBLISH_DATE
    )
    music_albums = @music_albums_repository.fetch_all

    expect(music_albums.length).to eq(1)
    expect(music_albums[0]).to eq new_music_album
  end
end

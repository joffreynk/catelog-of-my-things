require_relative './list_music_albums_service'
require_relative '../../../../shared/repositories/memory_repository'

describe ListMusicAlbumsService do
  before(:each) do
    @music_albums_repository = MemoryRepository.new
    @list_music_albums_service = ListMusicAlbumsService.new(@music_albums_repository)
  end

  it 'should be able to list all available music albums' do
    num_music_albums_to_create = 3
    fake_music_albums = []

    num_music_albums_to_create.times do |i|
      fake_music_album = {
        id: i
      }

      @music_albums_repository.save(fake_music_album)
      fake_music_albums.push(fake_music_album)
    end

    result = @list_music_albums_service.execute

    expect(result.length).to eq(num_music_albums_to_create)
    expect(result).to match_array(fake_music_albums)
  end
end

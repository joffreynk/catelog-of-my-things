require 'date'
require_relative '../music_album'

FAKE_ON_SPOTIFY ||= true
FAKE_PUBLISH_DATE ||= '2018-10-10'
FAKE_ID ||= 1

def create_music_album_object(fake_id=nil)
  fake_entity = double('entity')

  allow(fake_entity).to receive(:id) { fake_id }
  allow(fake_entity).to receive(:add_item) { |item| item }

  MusicAlbum.new(
    id: fake_id,
    genre: fake_entity,
    author: fake_entity,
    label: fake_entity,
    on_spotify: FAKE_ON_SPOTIFY,
    publish_date: FAKE_PUBLISH_DATE
  )
end

describe MusicAlbum do
  before(:each) do
    @music_album = create_music_album_object(FAKE_ID)
  end

  describe '#new' do
    it 'takes the correct parameters and returns a MusicAlbum object' do
      expect(@music_album).to be_instance_of MusicAlbum
    end

    it 'should not create a new MusicAlbum object without parameters' do
      expect { MusicAlbum.new }.to raise_error(ArgumentError)
    end

    it 'should create a MusicAlbum object with unique ID' do
      new_music_albums_to_create = 10
      new_music_albums_ids = []

      new_music_albums_to_create.times do
        new_music_album = create_music_album_object
        new_music_albums_ids.push(new_music_album.id)
      end

      expect(new_music_albums_ids).not_to include(@music_album.id)
    end
  end

  describe '#to_hash' do
    it 'returns the correct hash representation of a MusicAlbum object' do
      fake_music_album_hash = {
        id: FAKE_ID,
        archived: false,
        publish_date: Date.parse(FAKE_PUBLISH_DATE),
        on_spotify: FAKE_ON_SPOTIFY,
        label_id: FAKE_ID,
        author_id: FAKE_ID,
        genre_id: FAKE_ID
      }
      expect(@music_album.to_hash).to eq fake_music_album_hash
    end
  end

  describe '#on_spotify' do
    it 'returns the correct on_spotify value' do
      expect(@music_album.on_spotify).to eq FAKE_ON_SPOTIFY
    end
  end
end

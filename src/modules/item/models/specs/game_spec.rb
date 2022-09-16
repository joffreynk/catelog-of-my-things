require 'date'
require_relative '../game'

FAKE_MULTIPLAYER ||= false
FAKE_LAST_PLAYED_AT ||= '2020-10-10'
FAKE_PUBLISH_DATE ||= '2018-10-10'
FAKE_ID ||= 1

def create_game_object(fake_id=nil)
  fake_entity = double('entity')

  allow(fake_entity).to receive(:id) { fake_id }
  allow(fake_entity).to receive(:add_item) { |item| item }

  Game.new(
    id: fake_id,
    genre: fake_entity,
    author: fake_entity,
    label: fake_entity,
    multiplayer: FAKE_MULTIPLAYER,
    last_played_at: FAKE_LAST_PLAYED_AT,
    publish_date: FAKE_PUBLISH_DATE
  )
end

describe Game do
  before(:each) do
    @game = create_game_object(FAKE_ID)
  end

  describe '#new' do
    it 'takes the correct parameters and returns a Game object' do
      expect(@game).to be_instance_of Game
    end

    it 'should not create a new Game object without parameters' do
      expect { Game.new }.to raise_error(ArgumentError)
    end

    it 'should create a Game object with unique ID' do
      new_games_to_create = 10
      new_games_ids = []

      new_games_to_create.times do
        new_game = create_game_object
        new_games_ids.push(new_game.id)
      end

      expect(new_games_ids).not_to include(@game.id)
    end
  end

  describe '#to_hash' do
    it 'returns the correct hash representation of a Game object' do
      fake_game_hash = {
        id: FAKE_ID,
        archived: false,
        publish_date: Date.parse(FAKE_PUBLISH_DATE),
        last_played_at: Date.parse(FAKE_LAST_PLAYED_AT),
        multiplayer: FAKE_MULTIPLAYER,
        label_id: FAKE_ID,
        author_id: FAKE_ID,
        genre_id: FAKE_ID
      }
      expect(@game.to_hash).to eq fake_game_hash
    end
  end

  describe '#multiplayer' do
    it 'returns the correct multiplayer value' do
      expect(@game.multiplayer).to eq FAKE_MULTIPLAYER
    end
  end

  describe '#last_played_at' do
    it 'returns the correct last_played_at value' do
      expect(@game.last_played_at).to eq Date.parse(FAKE_LAST_PLAYED_AT)
    end
  end
end

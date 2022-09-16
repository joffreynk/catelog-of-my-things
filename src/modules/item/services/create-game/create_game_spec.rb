require_relative './create_game_service'
require_relative '../../../../shared/repositories/memory_repository'

FAKE_MULTIPLAYER ||= false
FAKE_LAST_PLAYED_AT ||= '2020-10-10'
FAKE_PUBLISH_DATE ||= '2018-10-10'
FAKE_ID ||= 1

describe CreateGameService do
  before(:each) do
    @games_repository = MemoryRepository.new
    fake_entity = double('entity')
    fake_entities_repository = double('entities_repository')

    allow(fake_entity).to receive(:add_item) { |item| item }
    allow(fake_entities_repository).to receive(:find_by_id) { |id| fake_entity }

    @create_game_service = CreateGameService.new(
      games_repository: @games_repository,
      genres_repository: fake_entities_repository,
      authors_repository: fake_entities_repository,
      labels_repository: fake_entities_repository
    )
  end

  it 'should be able to create a new game' do
    new_game = @create_game_service.execute(
      genre_id: FAKE_ID,
      author_id: FAKE_ID,
      label_id: FAKE_ID,
      multiplayer: FAKE_MULTIPLAYER,
      last_played_at: FAKE_LAST_PLAYED_AT,
      publish_date: FAKE_PUBLISH_DATE
    )
    games = @games_repository.fetch_all

    expect(games.length).to eq(1)
    expect(games[0]).to eq new_game
  end
end

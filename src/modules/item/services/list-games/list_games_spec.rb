require_relative './list_games_service'
require_relative '../../../../shared/repositories/memory_repository'

describe ListGamesService do
  before(:each) do
    @games_repository = MemoryRepository.new
    @list_games_service = ListGamesService.new(@games_repository)
  end

  it 'should be able to list all available games' do
    num_games_to_create = 3
    fake_games = []

    num_games_to_create.times do |i|
      fake_game = {
        id: i
      }

      @games_repository.save(fake_game)
      fake_games.push(fake_game)
    end

    result = @list_games_service.execute

    expect(result.length).to eq(num_games_to_create)
    expect(result).to match_array(fake_games)
  end
end

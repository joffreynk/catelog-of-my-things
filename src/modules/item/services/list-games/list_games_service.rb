require_relative '../../models/game'

class ListGamesService
  def initialize(games_repository)
    @games_repository = games_repository
  end

  def execute
    @games_repository.fetch_all
  end
end

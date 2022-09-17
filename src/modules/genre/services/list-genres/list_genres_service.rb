require_relative '../../models/genre'

class ListGenresService
  def initialize(genre_repository)
    @genre_repository = genre_repository
  end

  def execute
    @genre_repository.fetch_all
  end
end

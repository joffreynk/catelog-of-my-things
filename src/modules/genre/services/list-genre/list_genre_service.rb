require_relative '../../models/genre.rb'

class ListAuthorsService
  def initialize(genre_repository)
    @genre_repository = genre_repository
  end

  def execute
    @genre_repository.fetch_all
  end
end

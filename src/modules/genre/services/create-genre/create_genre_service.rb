require_relative '../../models/genre.rb'

class CreateGenreService
  def initialize(genre_repository)
    @genre_repository =genre_repository
  end

  def execute(name:)
    new_genre = Genre.new(name)
    @genre_repository.save(new_genre)
    new_genre
  end
end

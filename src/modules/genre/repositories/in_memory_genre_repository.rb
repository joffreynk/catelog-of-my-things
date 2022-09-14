class InMemoryGenreRepository
  def initialize(initial_genre = [])
    @genre = initial_genre
  end

  def fetch_all
    @genre
  end

  def find_by_id(genre_id)
    @genre.find { |genre| genre.id == genre_id }
  end

  def save(new_genre)
    @genre.push(new_genre)
  end

  def empty?
    @genre.empty?
  end
end

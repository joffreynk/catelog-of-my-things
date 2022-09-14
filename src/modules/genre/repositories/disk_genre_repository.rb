require 'json'

require_relative './in_memory_genre_repository.rb '
require_relative '../../../utils/file.utils'

class DiskGenreRepository
  def initialize
    genre_json_data = read_genre_file
    @in_memory_genre_repository = InMemoryGenreRepository.new(
      genre_json_data == '' ? [] : parse_json(genre_json_data)
    )
  end

  def fetch_all
    @in_memory_genre_repository.fetch_all
  end

  def find_by_id(genre_id)
    @in_memory_genre_repository.find_by_id(genre_id)
  end

  def save(new_genre)
    @in_memory_genre_repository.save(new_genre)

    write_genre_file(to_json)
  end

  def empty?
    @in_memory_genre_repository.empty?
  end

  private

  def read_genre_file
    read_file('./src/data/genre.json')
  end

  def write_genre_file(genre_json_data)
    write_file('./src/data/genre.json', genre_json_data)
  end

  def parse_json(genre_json_data)
    genre_hash = JSON.parse(genre_json_data)
    genre_hash.map do |genre_hash|
      id, name = genre_hash.values_at('id', 'name', )
      Author.new(name, id: id)
    end
  end

  def to_json
    genre_hash = @in_memory_genre_repository.fetch_all.map { |genre| genre.to_hash }
    JSON.pretty_generate(genre_hash)
  end
end

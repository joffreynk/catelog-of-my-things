require 'json'

require_relative './in_memory_authors_repository'
require_relative '../../../utils/file.utils'

class DiskAuthorsRepository
  def initialize
    authors_json_data = read_authors_file
    @in_memory_authors_repository = InMemoryAuthorsRepository.new(
      authors_json_data == '' ? [] : parse_json(authors_json_data)
    )
  end

  def fetch_all
    @in_memory_authors_repository.fetch_all
  end

  def find_by_id(author_id)
    @in_memory_authors_repository.find_by_id(author_id)
  end

  def save(new_author)
    @in_memory_authors_repository.save(new_author)

    write_authors_file(to_json)
  end

  def empty?
    @in_memory_authors_repository.empty?
  end

  private

  def read_authors_file
    read_file('./src/data/authors.json')
  end

  def write_authors_file(authors_json_data)
    write_file('./src/data/authors.json', authors_json_data)
  end

  def parse_json(authors_json_data)
    authors_hash = JSON.parse(authors_json_data)
    authors_hash.map do |author_hash|
      id, first_name, last_name = author_hash.values_at('id', 'first_name', 'last_name')
      Author.new(first_name, last_name, id: id)
    end
  end

  def to_json
    authors_hash = @in_memory_authors_repository.fetch_all.map { |author| author.to_hash }
    JSON.pretty_generate(authors_hash)
  end
end

require 'json'

require_relative '../models/book'
require_relative '../../../shared/repositories/disk_repository'

class DiskBooksRepository < DiskRepository
  def initialize(
    genres_repository,
    authors_repository,
    labels_repository
  )
    @genres_repository = genres_repository
    @authors_repository = authors_repository
    @labels_repository = labels_repository
    super('./src/shared/data/books.json')
  end

  private

  def parse_json(books_json_data)
    books_hash = JSON.parse(books_json_data)
    books_hash.map do |book_hash|
      id,
      genre_id,
      author_id,
      label_id,
      publish_date,
      archived,
      publisher,
      cover_state = book_hash.values_at(
        'id',
        'genre_id',
        'author_id',
        'label_id',
        'publish_date',
        'archived',
        'publisher',
        'cover_state'
      )

      genre = @genres_repository.find_by_id(genre_id)
      author = @authors_repository.find_by_id(author_id)
      label = @labels_repository.find_by_id(label_id)

      Book.new(
        genre: genre,
        author: author,
        label: label,
        publisher: publisher,
        cover_state: cover_state,
        archived: archived,
        publish_date: publish_date,
        id: id
      )
    end
  end
end

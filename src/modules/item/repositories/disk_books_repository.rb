require 'json'

require_relative '../models/book'
require_relative '../../../shared/repositories/disk_repository'

class DiskBooksRepository < DiskRepository
  def initialize
    super('./src/shared/data/books.json')
  end

  protected

  def parse_json(books_json_data)
    books_hash = JSON.parse(books_json_data)
    books_hash.map do |book_hash|
      iid,
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
        'archived',
        'publish_date',
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
        id: id,
      )
    end
  end
end

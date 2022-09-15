require 'json'

require_relative '../models/book'
require_relative '../../label/models/label'
require_relative '../../author/models/author'
require_relative '../../genre/models/genre'
require_relative '../../../shared/repositories/disk_repository'

class DiskbooksRepository < DiskRepository
  def initialize
    super('./src/shared/data/books.json')
  end

  protected

  def parse_json(books_json_data)
    books_hash = JSON.parse(books_json_data)
    books_hash.map do |book_hash|
      id, publisher, cover_state, genre, author, label, archived, publish_date = book_hash.values_at('id', 'publisher', 'cover_state', 'genre', 'author', 'label', 'archived', 'publish_date')
      new_label = Label.new(title: label['title'], color: label['color'])
      new_author = Author.new(first_name: author['first_name'], last_name: author['last_name'])
      new_genre = Genre.new(genre['name'])
      Book.new(publisher, cover_state, new_genre, new_author, new_label, archived, publish_date)
    end
  end
end

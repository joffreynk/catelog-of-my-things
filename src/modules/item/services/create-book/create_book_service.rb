require_relative '../../models/book'

class CreatebookService
  def initialize(books_repository)
    @books_repository = books_repository
  end

  def execute(service_request)
    id, publisher, cover_state, genre, author, label, archived, publish_date = service_request.values_at('id', 'publisher', 'cover_state', 'genre', 'author', 'label', 'archived', 'publish_date')
    new_label = Label.new(title: label['title'], color: label['color'])
    new_author = Author.new(first_name: author['first_name'], last_name: author['last_name'])
    new_genre = Genre.new(genre['name'])
      
    new_book = Book.new(publisher, cover_state, new_genre, new_author, new_label, archived, publish_date)


    # title, color = service_request.values_at(:title, :color)
    # new_book = Book.new(title: title, color: color)
    @books_repository.save(new_book)
    new_book
  end
end

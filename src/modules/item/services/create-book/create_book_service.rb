require_relative '../../models/book'

class CreateBookService
  def initialize(
    books_repository,
    genres_repository,
    authors_repository,
    labels_repository
  )
    @books_repository = books_repository
    @genres_repository = genres_repository
    @authors_repository = authors_repository
    @labels_repository = labels_repository
  end

  def execute(service_request)
    genre_id,
    author_id,
    label_id,
    publish_date,
    publisher,
    cover_state = service_request.values_at(
      :genre_id,
      :author_id,
      :label_id,
      :publish_date,
      :publisher,
      :cover_state
    )

    genre = @genres_repository.find_by_id(genre_id)

    raise StandardError, "No genre with the ID #{genre_id}." unless genre

    author = @authors_repository.find_by_id(author_id)

    raise StandardError, "No author with the ID #{author_id}." unless author

    label = @labels_repository.find_by_id(label_id)

    raise StandardError, "No label with the ID #{label_id}." unless label

    new_book = Book.new(
      genre: genre,
      author: author,
      label: label,
      publisher: publisher,
      cover_state: cover_state,
      publish_date: publish_date
    )
    @books_repository.save(new_book)
    new_book
  end
end

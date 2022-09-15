require_relative '../../models/book'

class ListBooksService
  def initialize(books_repository)
    @books_repository = books_repository
  end

  def execute
    @books_repository.fetch_all
  end
end
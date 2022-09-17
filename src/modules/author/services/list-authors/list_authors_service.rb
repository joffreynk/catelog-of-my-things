require_relative '../../models/author'

class ListAuthorsService
  def initialize(authors_repository)
    @authors_repository = authors_repository
  end

  def execute
    @authors_repository.fetch_all
  end
end

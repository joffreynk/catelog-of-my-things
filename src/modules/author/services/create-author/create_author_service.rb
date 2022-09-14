require_relative '../../models/author'

class CreateAuthorService
  def initialize(authors_repository)
    @authors_repository = authors_repository
  end

  def execute(service_request)
    first_name, last_name = service_request.values_at(:first_name, :last_name)

    new_author = Author.new(first_name, last_name)
    @authors_repository.save(new_author)

    new_author
  end
end

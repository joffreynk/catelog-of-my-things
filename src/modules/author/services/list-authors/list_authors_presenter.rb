require_relative './list_authors_service'

class ListAuthorsPresenter
  def initialize(authors_repository)
    @authors_repository = authors_repository
  end

  def handle
    begin
      list_authors_service = ListAuthorsService.new(@authors_repository)
      authors = list_authors_service.execute

      return {
        success: true,
        data: authors
      }
    rescue => exception
      return {
        success: false,
        error: exception.message
      }
    end
  end
end

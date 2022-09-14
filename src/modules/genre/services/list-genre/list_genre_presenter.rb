require_relative './list_genre_service.rb'

class ListAuthorsPresenter
  def initialize(genre_repository)
    @genre_repository = genre_repository
  end

  def handle
    begin
      list_genre_service = ListGenreService.new(@genre_repository)
      genre = list_genre_service.execute

      return {
        success: true,
        data:genre
      }
    rescue => exception
      return {
        success: false,
        error: exception.message
      }
    end
  end
end

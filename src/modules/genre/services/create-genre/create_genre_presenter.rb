require_relative './create_genre_service.rb'

class CreateAuthorPresenter
  def initialize(genre_repository)
    @genre_repository = genre_repository
  end

  def handle(request)
    begin
      name = request.values_at(:name)

      create_genre_service = CreateGenreService.new(@genre_repository)
      new_genre = create_genre_service.execute(
        name:name,

      )

      return {
        success: true,
        data: new_genre
      }
    rescue => exception
      return {
        success: false,
        error: exception.message
      }
    end
  end
end

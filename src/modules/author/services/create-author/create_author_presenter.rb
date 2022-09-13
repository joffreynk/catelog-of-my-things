require_relative './create_author_service.rb'

class CreateAuthorPresenter
  def initialize(authors_repository)
    @authors_repository = authors_repository
  end

  def handle(request)
    begin
      first_name, last_name = request.values_at(:first_name, :last_name)

      create_author_service = CreateAuthorService.new(@authors_repository)
      new_author = create_author_service.execute(
        first_name: first_name,
        last_name: last_name
      )

      return {
        success: true,
        data: new_author
      }
    rescue => exception
      return {
        success: false,
        error: exception.message
      }
    end
  end
end

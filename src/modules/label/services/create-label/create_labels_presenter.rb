require_relative './create_labels_service.rb'

class CreateAuthorPresenter
  def initialize(labels_repository)
    @labels_repository = labels_repository
  end

  def handle(request)
    begin
      title, color = request.values_at(:title, :color)

      create_label_service = CreateLabelService.new(@labels_repository)
      new_label = create_label_service.execute(
        title: title,
        color: color
      )

      return {
        success: true,
        data: new_label
      }
    rescue => exception
      return {
        success: false,
        error: exception.message
      }
    end
  end
end
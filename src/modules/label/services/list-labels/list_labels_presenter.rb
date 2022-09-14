require_relative './list_labels_service'

class ListLabelsPresenter
  def initialize(labels_repository)
    @labels_repository = labels_repository
  end

  def handle
    begin
      list_labels_service = ListLabelsService.new(@labels_repository)
      labels = list_labels_service.execute

      return {
        success: true,
        data: labels
      }
    rescue => exception
      return {
        success: false,
        error: exception.message
      }
    end
  end
end
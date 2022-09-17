require_relative '../../models/label'

class ListLabelsService
  def initialize(labels_repository)
    @labels_repository = labels_repository
  end

  def execute
    @labels_repository.fetch_all
  end
end

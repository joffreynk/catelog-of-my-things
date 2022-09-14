require_relative '../../models/book'

class ListLabelsService
  def initialize(labels_repository)
    @labels_repository = labels_repository
  end

  def execute
    @labels_repository.fetch_all
  end
end
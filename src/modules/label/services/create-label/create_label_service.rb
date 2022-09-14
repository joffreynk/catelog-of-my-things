require_relative '../../models/label'
class CreateLabelService
  def initialize(labels_repository)
    @labels_repository = labels_repository
  end

  def execute(title:, color:)
    new_label = Label.new(title:title, color:color)
    @labels_repository.save(new_label)
    new_label
  end
end
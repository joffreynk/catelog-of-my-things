require_relative '../../models/book'

class CreateLabelService
  def initialize(labels_repository)
    @labels_repository = labels_repository
  end

  def execute(service_request)
    title, color = service_request.values_at(:title, :color)

    new_label = Label.new(title: title, color: color)
    @labels_repository.save(new_label)
    new_label
  end
end

class InMemoryLabelsRepository
  def initialize(initial_labels = [])
    @labels = initial_labels
  end

  def fetch_all
    @labels
  end

  def find_by_id(label_id)
    @labels.find { |label| label.id == label_id }
  end

  def save(new_label)
    @labels.push(new_label)
  end

  def empty?
    @labels.empty?
  end
end
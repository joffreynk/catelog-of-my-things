require 'json'

require_relative './in_memory_labels_repository'
require_relative '../../../utils/file.utils'

class DiskLabelsRepository
  def initialize
    labels_json_data = read_labels_file
    @in_memory_labels_repository = InMemoryLabelsRepository.new(
      labels_json_data == '' ? [] : parse_json(labels_json_data)
    )
  end

  def fetch_all
    @in_memory_labels_repository.fetch_all
  end

  def find_by_id(label_id)
    @in_memory_labels_repository.find_by_id(label_id)
  end

  def save(new_label)
    @in_memory_labels_repository.save(new_label)

    write_labels_file(to_json)
  end

  def empty?
    @in_memory_labels_repository.empty?
  end

  private

  def read_labels_file
    read_file('./src/data/labels.json')
  end

  def write_labels_file(labels_json_data)
    write_file('./src/data/labels.json', labels_json_data)
  end

  def parse_json(labels_json_data)
    labels_hash = JSON.parse(labels_json_data)
    labels_hash.map do |label_hash|
      id, title, color = label_hash.values_at('id', 'title', 'color')
      label.new(title, color, id: id)
    end
  end

  def to_json
    labels_hash = @in_memory_labels_repository.fetch_all.map { |label| label.to_hash }
    JSON.pretty_generate(labels_hash)
  end
end
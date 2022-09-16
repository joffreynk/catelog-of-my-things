require 'json'

require_relative '../models/label'
require_relative '../../../shared/repositories/disk_repository'

class DiskLabelsRepository < DiskRepository
  def initialize
    super('./src/shared/data/labels.json')
  end

  private

  def parse_json(labels_json_data)
    labels_hash = JSON.parse(labels_json_data)
    labels_hash.map do |label_hash|
      id, title, color = label_hash.values_at('id', 'title', 'color')
      Label.new(title:title, color:color, id: id)
    end
  end
end

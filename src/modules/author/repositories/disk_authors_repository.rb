require 'json'

require_relative '../models/author'
require_relative '../../../shared/repositories/disk_repository'

class DiskAuthorsRepository < DiskRepository
  def initialize
    super('./src/shared/data/authors.json')
  end

  private

  def parse_json(authors_json_data)
    authors_hash = JSON.parse(authors_json_data)
    authors_hash.map do |author_hash|
      id, first_name, last_name = author_hash.values_at('id', 'first_name', 'last_name')
      Author.new(first_name, last_name, id: id)
    end
  end
end

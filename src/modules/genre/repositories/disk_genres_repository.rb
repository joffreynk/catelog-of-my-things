require 'json'

require_relative '../models/genre'
require_relative '../../../shared/repositories/disk_repository'

class DiskGenresRepository < DiskRepository
  def initialize
    super('./src/shared/data/genres.json')
  end

  private

  def parse_json(genre_json_data)
    genre_hash = JSON.parse(genre_json_data)
    genre_hash.map do |genre_hash|
      id, name = genre_hash.values_at('id', 'name')
      Genre.new(name, id: id)
    end
  end
end

require 'json'

require_relative './memory_repository'
require_relative '../utils/file.utils'

class DiskRepository
  def initialize(file_path)
    raise 'Abstract classes can\'t be instantiated.' if self.instance_of?(DiskRepository)
    @file_path = file_path
    entities_json_data = read_entities_file
    @memory_repository = MemoryRepository.new(
      entities_json_data == '' ? [] : parse_json(entities_json_data)
    )
  end

  def fetch_all
    @memory_repository.fetch_all
  end

  def find_by_id(entity_id)
    @memory_repository.find_by_id(entity_id)
  end

  def save(new_entity)
    @memory_repository.save(new_entity)

    write_entities_file(to_json)
  end

  def empty?
    @memory_repository.empty?
  end

  protected

  def read_entities_file
    read_file(@file_path)
  end

  def write_entities_file(entities_json_data)
    write_file(@file_path, entities_json_data)
  end

  def parse_json(entities_json_data)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def to_json
    entities_hash = @memory_repository.fetch_all.map { |entity| entity.to_hash }
    JSON.pretty_generate(entities_hash)
  end
end
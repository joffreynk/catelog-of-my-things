class MemoryRepository
  def initialize(initial_entities = [])
    @entities = initial_entities
  end

  def fetch_all
    @entities
  end

  def find_by_id(entity_id)
    @entities.find { |entity| entity.id == entity_id }
  end

  def save(new_entity)
    @entities.push(new_entity)
  end

  def empty?
    @entities.empty?
  end
end

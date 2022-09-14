require_relative '../../../shared/models/entity'

class Genre < Entity
  attr_reader :items
  attr_accessor :name

  def initialize(name, id: nil)
    super(id)
    @name = name
    @items = []
  end

  def to_hash
    {
      id: @id,
      name: @name
    }
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
  end
end

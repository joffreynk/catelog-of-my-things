require_relative '../../../shared/models/entity'

class Author < Entity
  attr_reader :items
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name, id: nil)
    super(id)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def to_hash
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
    }
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
  end
end

require_relative '../../../shared/models/entity'

class Label < Entity
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title:, color:, id: nil)
    super(id)
    @title = title
    @color = color
    @items = []
  end

  def to_hash
    {
      id: @id,
      title: @title,
      color: @color
    }
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
  end
end

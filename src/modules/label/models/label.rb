class Label
  @@increment = 1
  attr_accessor :title, :color
  attr_reader :items, :id
  def initialize(title:, color:, id:nil)
    @@increment += 1
    @id = id || @@increment
    @title = title
    @color  = color
    @items = []
  end

  def to_hash
    {
      id: @id,
      title: @title,
      color: @color
    }
  end

  def att_item(item)
    @items.push(item) unless @items.includes(item)
  end
end

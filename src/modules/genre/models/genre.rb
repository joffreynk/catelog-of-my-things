class Genre
  attr_reader :id, :items
  attr_accessor :name,

  @@num_instances = 0

  def initialize(name, id: nil)
    @name = name


    @items = []
    @@num_instances += 1
    @id = id || @@num_instances
  end

  def to_hash
    {
      id: @id,
      name: @name,

    }
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
  end
end

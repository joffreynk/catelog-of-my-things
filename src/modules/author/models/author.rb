class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  @@num_instances = 0

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name

    @items = []
    @@num_instances += 1
    @id = @@num_instances
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
  end
end

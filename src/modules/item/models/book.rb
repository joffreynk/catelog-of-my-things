require_relative './item'

class Book < Item
  attr_accessor :publisher, :cove_state
  @@increment = 1
  def initialize(publisher, cove_state, genre:, author:, label:, archived: false, publish_date: DateTime.now)
    @@increment += 1
    @id = @@increment
    super(genre:, author:, label:, archived: false, publish_date: DateTime.now)
    @publisher = publisher
    @cove_state = cove_state
  end
end
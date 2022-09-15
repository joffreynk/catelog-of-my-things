require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state
  def initialize(publisher:, cover_state:, genre:, author:, label:, archived: false, publish_date: DateTime.now, id: nil)
    super(genre:, author:, label:, archived: false, publish_date: DateTime.now, id:id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    (DateTime.now.year-publish_date) >= 10
  end

  def move_to_archive
    @archived = can_be_archived?
end

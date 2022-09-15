require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state
  def initialize(genre:, author:, label:,publisher:, cover_state:,  archived: false, publish_date: DateTime.now, id: nil)
    super(genre:, author:, label:, archived: false, publish_date: DateTime.now, id:id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    (DateTime.now.year - publish_date) >= 10 || @cover_state == 'bad'
  end

  def to_hash
    {
      id: @id,
      publisher: @publisher,
      cover_state: @cover_state,
      genre_id: @genre.id,
      author_: @author.id,
      label_id: @label.id,
      archived: @archived,
      publish_date: @publish_date,
    }
  end
end

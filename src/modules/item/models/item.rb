require 'date'

class Item < Entity
  attr_reader :archived, :genre, :author, :label
  attr_accessor :publish_date

  def initialize(genre:, author:, label:, archived: false, publish_date:, id:)
    super(id)
    @archived = archived
    @publish_date = publish_date

    self.genre = genre
    self.author = author
    self.label = label
  end

  def genre=(genre)
    @genre = genre
    @genre.add_item(self)
  end

  def author=(author)
    @author = author
    @author.add_item(self)
  end

  def label=(label)
    @label = label
    @label.add_item(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private
  def can_be_archived?
    now = Date.now.year
    now - @publish_date.year > 10
  end
end


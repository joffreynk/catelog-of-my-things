require 'date'

class Item
  attr_reader :id, :archived, :genre, :author, :label
  attr_accessor :publish_date

  @@num_instances = 0

  def initialize(genre:, author:, label:, archived: false, publish_date: DateTime.now)
    @archived = archived
    @publish_date = publish_date

    self.genre = genre
    self.author = author
    self.label = label

    @@num_instances += 1
    @id = @@num_instances
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


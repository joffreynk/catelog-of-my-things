require 'date'

class Item
  attr_reader :id, :archived, :genre, :author, :label
  attr_accessor :publish_date

  @@num_instances = 0

  def initialize(genre:, author:, label:, archived: false)
    @@num_instances += 1
    @id = @@num_instances

    self.genre = genre
    self.author = author
    self.label = label

    @archived = archived
    @publish_date = DateTime.now
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
end


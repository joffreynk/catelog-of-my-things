require 'date'

class Item < Entity
  attr_reader :archived, :genre, :author, :label
  attr_accessor :publish_date

<<<<<<< HEAD
  def initialize(genre:, author:, label:, archived: false, publish_date:, id:)
=======
  def initialize(
    genre:,
    author:,
    label:,
    archived:,
    publish_date:,
    id:
  )
    raise 'Abstract classes can\'t be instantiated.' if self.instance_of?(Item)
>>>>>>> dev
    super(id)
    @archived = archived
    @publish_date = Date.parse(publish_date)

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
    curr_year = Date.now.year
    curr_year - @publish_date.year > 10
  end
end


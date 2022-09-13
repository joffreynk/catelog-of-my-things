class InMemoryAuthorsRepository
  def initialize
    @authors = []
  end

  def fetch_all
    @authors
  end

  def find_by_id(author_id)
    @authors.find { |author| author.id == author_id }
  end

  def save(new_author)
    @authors.push(new_author)
  end

  def empty?
    @authors.empty?
  end
end

require 'date'

require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(
    genre:,
    author:,
    label:,
    multiplayer:,
    last_played_at:,
    publish_date: DateTime.now,
    archived: false
    id: nil,
  )
    super(
      genre: genre,
      author: author,
      label: label,
      archived: archived,
      publish_date: publish_date,
      id: id
    )
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  private

  def can_be_archived?
    curr_year = Date.now.year
    super() && curr_year - @last_played_at.year > 2
  end
end

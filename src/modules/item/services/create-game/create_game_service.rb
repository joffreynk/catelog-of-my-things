require_relative '../../models/game'

class CreateGameService
  def initialize(
    games_repository:,
    genres_repository:,
    authors_repository:,
    labels_repository:
  )
    @games_repository = games_repository
    @genres_repository = genres_repository
    @authors_repository = authors_repository
    @labels_repository = labels_repository
  end

  def execute(service_request)
    genre_id,
    author_id,
    label_id,
    multiplayer,
    last_played_at,
    publish_date = service_request.values_at(
      :genre_id,
      :author_id,
      :label_id,
      :multiplayer,
      :last_played_at,
      :publish_date
    )

    puts "CreateGameService - genre_id: #{genre_id}"
    puts "CreateGameService - author_id: #{author_id}"
    puts "CreateGameService - label_id: #{label_id}"

    genre = @genres_repository.find_by_id(genre_id)

    raise StandardError, "No genre with the ID #{genre_id}." unless genre

    author = @authors_repository.find_by_id(author_id)

    raise StandardError, "No author with the ID #{author_id}." unless author

    label = @labels_repository.find_by_id(label_id)

    raise StandardError, "No label with the ID #{label_id}." unless label

    new_game = Game.new(
      genre: genre,
      author: author,
      label: label,
      multiplayer: multiplayer,
      last_played_at: last_played_at,
      publish_date: publish_date
    )
    @games_repository.save(new_game)
    new_game
  end
end

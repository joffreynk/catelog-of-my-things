require 'json'

require_relative '../models/game'
require_relative '../../../shared/repositories/disk_repository'

class DiskGamesRepository < DiskRepository
  def initialize(
    genres_repository,
    authors_repository,
    labels_repository
  )
    @genres_repository = genres_repository
    @authors_repository = authors_repository
    @labels_repository = labels_repository
    super('./src/shared/data/games.json')
  end

  private

  def parse_json(games_json_data)
    games_hash = JSON.parse(games_json_data)
    games_hash.map do |game_hash|
      id,
      genre_id,
      author_id,
      label_id,
      publish_date,
      archived,
      multiplayer,
      last_played_at = game_hash.values_at(
        'id',
        'genre_id',
        'author_id',
        'label_id',
        'publish_date',
        'archived',
        'multiplayer',
        'last_played_at'
      )

      genre = @genres_repository.find_by_id(genre_id)
      author = @authors_repository.find_by_id(author_id)
      label = @labels_repository.find_by_id(label_id)

      Game.new(
        genre: genre,
        author: author,
        label: label,
        multiplayer: multiplayer,
        last_played_at: last_played_at,
        publish_date: publish_date,
        archived: archived,
        id: id,
      )
    end
  end
end

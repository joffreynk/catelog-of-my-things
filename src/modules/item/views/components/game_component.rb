require_relative '../../../../shared/utils/console.utils'

class GameComponent < Component
  def to_string
    [
      "ID: #{@data.id} | Title: #{@data.label.title} | Genre: #{@data.genre.name} | Author: #{@data.author.first_name} #{@data.author.last_name}",
      "Is multiplayer? #{bool_to_string(@data.multiplayer)} | Is archived? #{bool_to_string(@data.archived)}",
      "Published at: #{@data.publish_date} | Last played at: #{@data.last_played_at}"
    ]
  end
end

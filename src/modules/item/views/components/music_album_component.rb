require_relative '../../../../shared/utils/console.utils'

class MusicAlbumComponent < Component
  def to_string
    [
      "ID: #{@data.id} | Title: #{@data.label.title} | Is on Spotify? #{bool_to_string(@data.on_spotify)} | Author: #{@data.author.first_name} #{@data.author.last_name}",
      "Genre: #{@data.genre.name} | Is archived? #{bool_to_string(@data.archived)} | Published at: #{@data.publish_date}"
    ]
  end
end

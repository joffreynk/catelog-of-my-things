require_relative '../../../../shared/views/components/component'

class BookComponent < Component
  def to_string
    [
      "ID: #{@data.id} | Author: #{@data.author.first_name} #{@data.author.last_name} | Publisher: #{@data.publisher} | Cover state: #{@data.cover_state}",
      "Title: #{@data.label.title} | Genre: #{@data.genre.name}",
      "Published at: #{@data.publish_date} | Is archived? #{bool_to_string(@data.archived)}"
    ]
  end
end

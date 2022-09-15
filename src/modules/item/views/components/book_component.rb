require_relative '../../../../shared/views/components/component'

class BookComponent < Component
  def to_string
    [
      "ID: #{@data.id} | Title: #{@data.label.title} | Genre: #{@data.genre.name} | Author: #{@data.author.first_name} #{@data.author.last_name}",
      "publisher ? #{@data.publisher} | Is archived? #{bool_to_string(@data.archived)}",
      "Published at: #{@data.publish_date} | cover state: #{@data.cover_state}"
    ]
  end
end

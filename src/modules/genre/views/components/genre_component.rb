require_relative '../../../../shared/views/components/component'

class GenreComponent < Component
  def to_string
    "ID: #{@data.id} | Name: #{@data.name}"
  end
end

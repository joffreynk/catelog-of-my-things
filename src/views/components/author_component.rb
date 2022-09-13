require_relative './component'

class AuthorComponent < Component
  def to_string
    "ID: #{@data.id} | First Name: #{@data.first_name} | Last Name: #{@data.last_name}"
  end
end

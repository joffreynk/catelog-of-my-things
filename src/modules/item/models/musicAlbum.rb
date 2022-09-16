require_relative './item.rb'

class MusicAlbum
attr_accessor :on_spotify

def initialize (
  id:nil
  genre:,
  author:,
  label:,
  archived: false,
  publish_date:DateTime.now,
)
super(
  id: id
  genre: genre,
  author: author
  label: label,
  archived: archived,
  publish_date: publish_date

)
end

def can_be_archived?
  curr_year= Date.now.year
  super && curr_year

end

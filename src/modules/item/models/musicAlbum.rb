require_relative './item.rb'

class MusicAlbum > item
attr_accessor :on_spotify

def initialize (
  id:nil
  genre:,
  author:,
  on_spotify:
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
@on_spotify=on_spotify
end

def to_hash
  {
    id: @id,
    archived: @archived,
    publish_date: @publish_date,
    on_spotify:@on_spotify,
    label_id: @label.id,
    author_id: @author.id,
    genre_id: @genre.id
  }
end

private


def can_be_archived?
 super && @on_spotify
end

end

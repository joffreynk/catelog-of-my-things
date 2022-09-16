require_relative '../components/music_album_component'
require_relative './item_screen_manager'

class MusicAlbumScreenManager < ItemScreenManager
  def initialize(
    create_music_album:,
    list_music_albums:,
    genres_screen_manager:,
    authors_screen_manager:,
    labels_screen_manager:
  )
    super(
      item_component_class: MusicAlbumComponent,
      list_items: list_music_albums,
      genres_screen_manager: genres_screen_manager,
      authors_screen_manager: authors_screen_manager,
      labels_screen_manager: labels_screen_manager,
      entity_type: 'music album'
    )
    @create_music_album = create_music_album
  end

  def handle_create_music_album
    handle_errors do
      item_attrs = handle_create_item

      return unless item_attrs

      on_spotify = get_user_input('Is this music album on Spotify? [Y/N]: ').downcase == 'y'

      new_music_album = @create_music_album.call(
        on_spotify: on_spotify,
        **item_attrs
      )

      print_success_entity_creation(new_music_album)
    end
  end

  def handle_list_music_albums
    handle_list_all('No music albums available.')
  end
end

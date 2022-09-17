require_relative '../components/genre_component'
require_relative '../../../../shared/views/screen-managers/entity_screen_manager'

class GenreScreenManager < EntityScreenManager
  def initialize(create_genre:, list_genres:)
    super(list_all: list_genres, component_class: GenreComponent)
    @create_genre = create_genre
  end

  def handle_create_genre
    handle_errors do
      name = get_user_input('Enter the genre\'s name: ')

      new_genre = @create_genre.call(name)

      print_success_entity_creation('genre', new_genre)
    end
  end

  def handle_list_genres
    handle_list_all('No genres available.')
  end
end

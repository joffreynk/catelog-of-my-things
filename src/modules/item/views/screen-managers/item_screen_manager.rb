require_relative '../../../../shared/utils/console.utils'
require_relative '../../../../shared/views/screen-managers/entity_screen_manager'

class ItemScreenManager < EntityScreenManager
  def initialize(
    item_component_class:,
    list_items:,
    genres_screen_manager:,
    authors_screen_manager:,
    labels_screen_manager:
  )
    raise 'Abstract classes can\'t be instantiated.' if self.instance_of?(ItemScreenManager)
    super(list_all: list_items, component_class: item_component_class)
    @genres_screen_manager = genres_screen_manager
    @authors_screen_manager = authors_screen_manager
    @labels_screen_manager = labels_screen_manager
  end

  private

  def handle_create_item
    if @authors_screen_manager.empty?
      print_message('No authors available. Please, add an author to the system first before trying to add a game.')
      return nil;
    end
    if @genres_screen_manager.empty?
      print_message('No genres available. Please, add a genre to the system first before trying to add a game.')
      return nil;
    end
    if @labels_screen_manager.empty?
      print_message('No labels available. Please, add a label to the system first before trying to add a game.')
      return nil;
    end

    @authors_screen_manager.handle_list_authors
    author_id = get_user_input('Enter the author ID you want to select: ').to_i
    @genres_screen_manager.handle_list_genres
    genre_id = get_user_input('Enter the genre ID you want to select: ').to_i
    @labels_screen_manager.handle_list_labels
    label_id = get_user_input('Enter the label ID you want to select: ').to_i

    publish_date = get_date_input('Enter the publish date (YYYY-MM-DD): ')

    {
      author_id: author_id,
      genre_id: genre_id,
      label_id: label_id,
      publish_date: publish_date
    }
  end
end
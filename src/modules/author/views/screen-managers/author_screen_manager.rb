require_relative '../components/author_component'
require_relative '../../../../shared/views/screen-managers/entity_screen_manager'

class AuthorScreenManager < EntityScreenManager
  def initialize(create_author:, list_authors:)
    super(list_all: list_authors, component_class: AuthorComponent)
    @create_author = create_author
  end

  def handle_create_author
    handle_errors do
      first_name = get_user_input('Enter the author\'s first name: ')
      last_name = get_user_input('Enter the author\'s last name: ')

      new_author = @create_author.call(
        first_name: first_name,
        last_name: last_name
      )

      print_success_entity_creation('author', new_author)
    end
  end

  def handle_list_authors
    handle_list_all('No authors available.')
  end
end

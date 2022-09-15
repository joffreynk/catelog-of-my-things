require_relative '../components/book_component'
require_relative '../../../../shared/views/screen-managers/entity_screen_manager'

class bookScreenManager < EntityScreenManager
  def initialize(create_book:, list_books:)
    super(list_all: list_books, component_class: bookComponent)
    @create_book = create_book
  end

  def handle_create_book
    handle_errors do
      title = get_user_input('Enter the book\'s title: ')
      color = get_user_input('Enter the book\'s color: ')

      new_book = @create_book.call(
        title: title,
        color: color
      )

      print_success_entity_creation('book', new_book)
    end
  end

  def handle_list_books
    handle_list_all('No books available.')
  end
end

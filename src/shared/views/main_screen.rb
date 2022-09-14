require_relative './components/menu_component'
require_relative '../../modules/author/views/screen-managers/author_screen_manager'

class MainScreen
  def initialize(handlers)
    author_screen_manager = AuthorScreenManager.new(
      create_author: handlers[:author][:create],
      list_authors: handlers[:author][:list]
    )

    @main_options = [
      {
        title: 'List all books.',
        handler: -> { puts 'Option selected' }
      },
      {
        title: 'List all music albums.',
        handler: -> { puts 'Option selected' }
      },
      {
        title: 'List all games.',
        handler: -> { puts 'Option selected' }
      },
      {
        title: 'List all genres.',
        handler: -> { puts 'Option selected' }
      },
      {
        title: 'List all labels.',
        handler: -> { puts 'Option selected' }
      },
      {
        title: 'List all authors.',
        handler: -> { author_screen_manager.handle_list_authors }
      },
      {
        title: 'Add a book.',
        handler: -> { puts 'Option selected' }
      },
      {
        title: 'Add a music album.',
        handler: -> { puts 'Option selected' }
      },
      {
        title: 'Add a game.',
        handler: -> { puts 'Option selected' }
      },
      {
        title: 'Add an author.',
        handler: -> { author_screen_manager.handle_create_author }
      },
      {
        title: 'Add a label.',
        handler: -> { puts 'Option selected' }
      },
      {
        title: 'Add a genre.',
        handler: -> { puts 'Option selected' }
      },
      {
        title: 'Exit.',
        handler: lambda { puts 'Exit'; handlers[:app][:exit].call }
      }
    ]
  end

  def build
    main_options_titles = @main_options.map { |option| option[:title] }
    menu_component = MenuComponent.new(main_options_titles)
    menu_component.render
    user_option = menu_component.get_user_option

    @main_options[user_option - 1][:handler].call if user_option
  end
end

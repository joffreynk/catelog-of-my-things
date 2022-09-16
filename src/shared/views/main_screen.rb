require_relative './components/menu_component'
require_relative '../../modules/author/views/screen-managers/author_screen_manager'
require_relative '../../modules/label/views/screen-managers/label_screen_manager'
require_relative '../../modules/genre/views/screen-managers/genre_screen_manager'
require_relative '../../modules/item/views/screen-managers/book_screen_manager'
require_relative '../../modules/item/views/screen-managers/game_screen_manager'

class MainScreen
  def initialize(handlers)
    @handlers = handlers

    author_screen_manager = AuthorScreenManager.new(
      create_author: handlers[:author][:create],
      list_authors: handlers[:author][:list]
    )
    label_screen_manager = LabelScreenManager.new(
      create_label: handlers[:label][:create],
      list_labels: handlers[:label][:list]
    )
    genre_screen_manager = GenreScreenManager.new(
      create_genre: handlers[:genre][:create],
      list_genres: handlers[:genre][:list]
    )
    game_screen_manager = GameScreenManager.new(
      create_game: handlers[:game][:create],
      list_games: handlers[:game][:list],
      genres_screen_manager: genre_screen_manager,
      authors_screen_manager: author_screen_manager,
      labels_screen_manager: label_screen_manager
    )

    book_screen_manager = BookScreenManager.new(
      create_book: handlers[:book][:create],
      list_books: handlers[:book][:list],
      genres_screen_manager: genre_screen_manager,
      authors_screen_manager: author_screen_manager,
      labels_screen_manager: label_screen_manager
    )

    @main_options = [
      {
        title: 'List all books.',
        handler: -> { book_screen_manager.handle_list_books }
      },
      {
        title: 'List all music albums.',
        handler: -> { puts 'Option selected' }
      },
      {
        title: 'List all games.',
        handler: -> { game_screen_manager.handle_list_games }
      },
      {
        title: 'List all genres.',
        handler: -> { genre_screen_manager.handle_list_genres }
      },
      {
        title: 'List all labels.',
        handler: -> { label_screen_manager.handle_list_labels }
      },
      {
        title: 'List all authors.',
        handler: -> { author_screen_manager.handle_list_authors }
      },
      {
        title: 'Add a book.',
        handler: -> { book_screen_manager.handle_create_book }
      },
      {
        title: 'Add a music album.',
        handler: -> { puts 'Option selected' }
      },
      {
        title: 'Add a game.',
        handler: -> { game_screen_manager.handle_create_game }
      },
      {
        title: 'Add an author.',
        handler: -> { author_screen_manager.handle_create_author }
      },
      {
        title: 'Add a label.',
        handler: -> { label_screen_manager.handle_create_label }
      },
      {
        title: 'Add a genre.',
        handler: -> { genre_screen_manager.handle_create_genre }
      },
      {
        title: 'Exit.',
        handler: lambda {
                   puts 'Exit'
                   handlers[:app][:exit].call
                 }
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

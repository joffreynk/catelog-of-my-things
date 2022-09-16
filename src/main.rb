require_relative './shared/views/main_screen'

require_relative './modules/author/repositories/disk_authors_repository'
require_relative './modules/author/services/create-author/create_author_service'
require_relative './modules/author/services/list-authors/list_authors_service'

require_relative './modules/label/repositories/disk_labels_repository'
require_relative './modules/label/services/create-label/create_label_service'
require_relative './modules/label/services/list-labels/list_labels_service'

require_relative './modules/genre/repositories/disk_genres_repository'
require_relative './modules/genre/services/create-genre/create_genre_service'
require_relative './modules/genre/services/list-genres/list_genres_service'

require_relative './modules/item/repositories/disk_books_repository'
require_relative './modules/item/services/create-book/create_book_service'
require_relative './modules/item/services/list-books/list_books_service'

require_relative './modules/item/repositories/disk_games_repository'
require_relative './modules/item/services/create-game/create_game_service'
require_relative './modules/item/services/list-games/list_games_service'

def main
  loop_lock = true

  # Initialize the Repositories:
  authors_repository = DiskAuthorsRepository.new
  labels_repository = DiskLabelsRepository.new
  genres_repository = DiskGenresRepository.new
  books_repository = DiskBooksRepository.new(
    genres_repository,
    authors_repository,
    labels_repository
  )
  games_repository = DiskGamesRepository.new(
    genres_repository,
    authors_repository,
    labels_repository
  )

  # Initialize the Author services:
  create_author_service = CreateAuthorService.new(authors_repository)
  list_authors_service = ListAuthorsService.new(authors_repository)

  # Initialize the Label services:
  create_label_service = CreateLabelService.new(labels_repository)
  list_labels_service = ListLabelsService.new(labels_repository)

  # Initialize the Genre services:
  create_genre_service = CreateGenreService.new(genres_repository)
  list_genres_service = ListGenresService.new(genres_repository)

  # Initialize the game services:
  create_game_service = CreateGameService.new(
    games_repository: games_repository,
    genres_repository: genres_repository,
    authors_repository: authors_repository,
    labels_repository: labels_repository
  )
  list_games_service = ListGamesService.new(games_repository)

   # Initialize the book services:
   create_book_service = CreateBookService.new(
    books_repository,
    genres_repository,
    authors_repository,
    labels_repository
  )
  list_books_service = ListBooksService.new(books_repository)

  handlers = {
    game: {
      create: lambda { |req| create_game_service.execute(req) },
      list: lambda { list_games_service.execute }
    },
    book: {
      create: lambda { |req| create_book_service.execute(req) },
      list: lambda { list_books_service.execute  }
    },
    genre: {
      create: lambda { |req| create_genre_service.execute(req) },
      list: lambda { list_genres_service.execute }
    },
    label: {
      create: lambda { |req| create_label_service.execute(req)},
      list: lambda { list_labels_service.execute }
    },
    author: {
      create: lambda { |req| create_author_service.execute(req) },
      list: lambda { list_authors_service.execute }
    },
    app: {
      exit: lambda { loop_lock = false }
    }
  }

  main_screen = MainScreen.new(handlers)

  while loop_lock
    main_screen.build
  end
end

main


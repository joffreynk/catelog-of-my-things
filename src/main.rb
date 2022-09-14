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

def main
  loop_lock = true

  # Initialize the Repositories:
  authors_repository = DiskAuthorsRepository.new
  labels_repository = DiskLabelsRepository.new
  genre_repository = DiskGenresRepository.new

  # Initialize the Author services:
  create_author_service = CreateAuthorService.new(authors_repository)
  list_authors_service = ListAuthorsService.new(authors_repository)

  # Initialize the Label services:
  create_label_service = CreateLabelService.new(labels_repository)
  list_labels_service = ListLabelsService.new(labels_repository)

  # Initialize the Genre services:
  create_genre_service = CreateGenreService.new(genre_repository)
  list_genres_service = ListGenresService.new(genre_repository)

  handlers = {
    game: {
      create: lambda { puts 'Function to create a game.' },
      list: lambda { puts 'Function to list all games.' }
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


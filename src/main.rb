require_relative './views/main_screen'
require_relative './modules/genre/repositories/disk_genre_repository'
require_relative './modules/genre/services/create-genre/create_genre_presenter'
require_relative './modules/genre/services/list-genre/list_genre_service'

def main
  loop_lock = true

  # Initialize the Repositories:
  genre_repository = DiskGenreRepository.new

  # Initialize the Author Presenters:
  create_genre_presenter = CreateGenrePresenter.new(genre_repository)
  list_genre_presenter = ListGenrePresenter.new(genre_repository)

  handlers = {
    game: {
      create: lambda { puts 'Function to create a game.' },
      list: lambda { puts 'Function to list all games.' }
    },
    genre: {
      create: lambda { |req| create_genre_presenter.handle(req) },
      list: lambda { list_create_presenter.handle }
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


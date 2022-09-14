require_relative './views/main_screen'
require_relative './modules/genre/repositories/disk_genre_repository'
require_relative './modules/genre/services/create-genre/create_genre_presenter'
require_relative './modules/genre/services/list-genre/list_genre_service'

require_relative './modules/label/repositories/disk_labels_repositories'
require_relative './modules/label/services/create-label/create_label_presenter'
require_relative './modules/label/services/list-labels/list_labels_presenter'
def main
  loop_lock = true
  labels_repository = DiskLabelsRepository.new
  create_label_presenter = CreateLabelPresenter.new(labels_repository)
  list_labels_presenter = ListLabelsPresenter.new(labels_repository)

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

    label: {
      create: lambda { |req| create_label_presenter.handle(req)},
      list: lambda { list_labels_presenter.handle }
    },
    author: {
      create: lambda { puts 'Function to create an author.' },
      list: lambda { puts 'Function to list all authors.' }

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


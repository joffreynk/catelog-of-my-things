require_relative './views/main_screen'

require_relative './modules/label/repositories/disk_labels_repositories'
require_relative './modules/label/services/create-label/create_label_presenter'
require_relative './modules/label/services/list-labels/list_labels_presenter'
def main
  loop_lock = true
  labels_repository = DiskLabelsRepository.new
  create_label_presenter = CreateLabelPresenter.new(labels_repository)
  list_labels_presenter = ListLabelsPresenter.new(labels_repository)

  handlers = {
    game: {
      create: lambda { puts 'Function to create a game.' },
      list: lambda { puts 'Function to list all games.' }
    },
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

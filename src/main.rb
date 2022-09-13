require_relative './views/main_screen'
require_relative './modules/author/repositories/in_memory_author_repository'
require_relative './modules/author/services/create-author/create_author_presenter'
require_relative './modules/author/services/list-authors/list_authors_presenter'

def main
  loop_lock = true

  # Initialize the Repositories:
  authors_repository = InMemoryAuthorsRepository.new

  # Initialize the Author Presenters:
  create_author_presenter = CreateAuthorPresenter.new(authors_repository)
  list_authors_presenter = ListAuthorsPresenter.new(authors_repository)

  handlers = {
    game: {
      create: lambda { puts 'Function to create a game.' },
      list: lambda { puts 'Function to list all games.' }
    },
    author: {
      create: lambda { |req| create_author_presenter.handle(req) },
      list: lambda { list_authors_presenter.handle }
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

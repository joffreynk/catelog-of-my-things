require_relative './shared/views/main_screen'
require_relative './modules/author/repositories/disk_authors_repository'
require_relative './modules/author/services/create-author/create_author_service'
require_relative './modules/author/services/list-authors/list_authors_service'

def main
  loop_lock = true

  # Initialize the Repositories:
  authors_repository = DiskAuthorsRepository.new

  # Initialize the Author Services:
  create_author_service = CreateAuthorService.new(authors_repository)
  list_authors_service = ListAuthorsService.new(authors_repository)

  handlers = {
    game: {
      create: lambda { puts 'Function to create a game.' },
      list: lambda { puts 'Function to list all games.' }
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


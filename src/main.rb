require_relative './views/main_screen'

def main
  loop_lock = true

  handlers = {
    game: {
      create: lambda { puts 'Function to create a game.' },
      list: lambda { puts 'Function to list all games.' }
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

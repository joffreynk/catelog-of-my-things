require_relative './components/menu_component'

class MainScreen
  def initialize(handlers)
    @handlers = handlers

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
        handler: -> { puts 'Option selected' }
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
        handler: -> { puts 'Option selected' }
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
        handler: lambda { puts 'Exit'; @handlers[:app][:exit].call }
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

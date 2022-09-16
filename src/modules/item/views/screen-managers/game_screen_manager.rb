require_relative '../components/game_component'
require_relative './item_screen_manager'

class GameScreenManager < ItemScreenManager
  def initialize(
    create_game:,
    list_games:,
    genres_screen_manager:,
    authors_screen_manager:,
    labels_screen_manager:
  )
    super(
      item_component_class: GameComponent,
      list_items: list_games,
      genres_screen_manager: genres_screen_manager,
      authors_screen_manager: authors_screen_manager,
      labels_screen_manager: labels_screen_manager,
      entity_type: 'game'
    )
    @create_game = create_game
  end

  def handle_create_game
    handle_errors do
      item_attrs = handle_create_item

      return unless item_attrs

      multiplayer = get_user_input('Is this game multiplayer? [Y/N]: ').downcase == 'y'
      last_played_at = get_date_input('When was this game last played (YYYY-MM-DD): ')

      new_game = @create_game.call(
        multiplayer: multiplayer,
        last_played_at: last_played_at,
        **item_attrs
      )

      print_success_entity_creation(new_game)
    end
  end

  def handle_list_games
    handle_list_all('No games available.')
  end
end

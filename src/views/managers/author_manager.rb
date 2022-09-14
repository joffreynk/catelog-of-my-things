require_relative '../components/author_component'
require_relative '../components/ordered_list_component'

class AuthorManager
  def initialize(create_author:, list_authors:)
    @create_author = create_author
    @list_authors = list_authors
  end

  def handle_create_author
    first_name = get_user_input('Enter the author\'s first name: ')
    last_name = get_user_input('Enter the author\'s last name: ')

    response = @create_author.call(
      first_name: first_name,
      last_name: last_name
    )

    if response[:success]
      new_author = response[:data]

      print_message('New author added successfuly')
      puts 'The new author added:'
      author_component = AuthorComponent.new(new_author)
      author_component.render
    else
      print_message("Error: #{response[:error]}")
    end
  end

  def handle_list_authors
    response = @list_authors.call

    if response[:success]
      authors = response[:data]

      if authors.empty?
        puts 'No authors available.'
      else
        authors_str = authors.map { |author| AuthorComponent.new(author).to_string }
        ordered_list = OrderedListComponent.new(authors_str)
        ordered_list.render
      end
    else
      print_message("Error: #{response[:error]}")
    end
  end
end

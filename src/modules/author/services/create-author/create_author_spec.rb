require_relative './create_author_service'
require_relative '../../repositories/in_memory_authors_repository'

describe CreateAuthorService do
  before(:each) do
    @authors_repository = InMemoryAuthorsRepository.new
    @create_author_service = CreateAuthorService.new(@authors_repository)
  end

  it 'should be able to create a new author' do
    first_name = 'John'
    last_name = 'Doe'

    new_author = @create_author_service.execute(
      first_name: first_name,
      last_name: last_name
    )
    authors = @authors_repository.fetch_all

    expect(new_author).to  have_attributes(first_name: first_name)
    expect(new_author).to  have_attributes(last_name: last_name)
    expect(authors.length).to eq(1)
  end
end

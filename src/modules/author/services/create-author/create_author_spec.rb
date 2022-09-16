require_relative './create_author_service'
require_relative '../../../../shared/repositories/memory_repository'

describe CreateAuthorService do
  before(:each) do
    @authors_repository = MemoryRepository.new
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

    expect(authors.length).to eq(1)
    expect(new_author).to have_attributes(first_name: first_name)
    expect(new_author).to have_attributes(last_name: last_name)
  end
end

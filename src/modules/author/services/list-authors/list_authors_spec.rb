require_relative './list_authors_service'
require_relative '../../repositories/in_memory_authors_repository'

describe ListAuthorsService do
  before(:each) do
    @authors_repository = InMemoryAuthorsRepository.new
    @list_authors_service = ListAuthorsService.new(@authors_repository)
  end

  it 'should be able to list all available authors' do
    num_authors_to_create = 3
    fake_authors = []

    num_authors_to_create.times do |i|
      fake_author = {
        first_name: "John #{i + 1}",
        last_name: "Doe #{i + 1}"
      }

      @authors_repository.save(fake_author)
      fake_authors.push(fake_author)
    end

    result = @list_authors_service.execute

    expect(result.length).to eq(num_authors_to_create)
    expect(result).to match_array(fake_authors)
  end
end

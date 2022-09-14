require_relative './author'

FAKE_FIRST_NAME = 'John'
FAKE_LAST_NAME = 'Doe'

describe Author do
  before(:each) do
    @author = Author.new(FAKE_FIRST_NAME, FAKE_LAST_NAME)
  end

  describe '#new' do
    it 'takes two parameters and returns an Author object' do
      expect(@author).to be_instance_of Author
    end

    it 'should not create a new Author object without parameters' do
      expect { Author.new }.to raise_error(ArgumentError)
    end

    it 'should create an Author object with unique ID' do
      new_authors_to_create = 10
      new_authors_ids = []

      new_authors_to_create.times do
        new_authors_ids.push(Author.new(FAKE_FIRST_NAME, FAKE_LAST_NAME).id)
      end

      expect(new_authors_ids).not_to include(@author.id)
    end
  end

  describe '#first_name' do
    it 'returns the correct first_name' do
      expect(@author.first_name).to eq FAKE_FIRST_NAME
    end
  end

  describe '#last_name' do
    it 'returns the correct last_name' do
      expect(@author.last_name).to eq FAKE_LAST_NAME
    end
  end
end

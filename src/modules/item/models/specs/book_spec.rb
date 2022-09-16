require 'date'
require_relative '../book'
require_relative '../../../author/models/author'
require_relative '../../../genre/models/genre'
require_relative '../../../label/models/label'

publisher = 'Joffrey'
cover_state = 'good'
publish_date = '2018-10-10'

describe Book do
  before(:each) do
    @genre = Genre.new('Tech')
    @author = Author.new('Joffrey', 'Doe')
    @label = Label.new(title: 'full ruby course', color: 'blue')
    @book = Book.new(
      genre: @genre,
      author: @author,
      label: @label,
      publisher: publisher,
      cover_state: cover_state,
      archived: false,
      publish_date: publish_date
    )
  end

  describe '#new' do
    it 'takes the correct parameters and returns a Book object' do
      expect(@book).to be_instance_of Book
    end

    it 'should not create a new Book object without parameters' do
      expect { Book.new }.to raise_error(ArgumentError)
    end
  end

  describe '#cover state' do
    it 'returns the value of  cover state' do
      expect(@book.cover_state).to eq cover_state
    end
  end
end

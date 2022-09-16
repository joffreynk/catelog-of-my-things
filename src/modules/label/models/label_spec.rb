require_relative './label'

title ||= 'Full stack Ruby'
color ||= 'blue'
id ||= 1

describe Label do
  before(:each) do
    @label = Label.new(title:title, color:color, id: id)
  end

  describe '#new' do
    it 'takes two parameters and returns an label object' do
      expect(@label).to be_instance_of Label
    end

    it 'should not create a new label object without parameters' do
      expect { Label.new }.to raise_error(ArgumentError)
    end

    it 'should create an label object with unique ID' do
      new_labels_to_create = 10
      new_labels_ids = []

      new_labels_to_create.times do
        new_labels_ids.push(Label.new(title: title, color: color))
      end

      expect(new_labels_ids).not_to include(@label.id)
    end
  end

  describe '#to_hash' do
    it 'returns the correct hash representation of an label object' do
      fake_label_hash = {
        id: id,
        title: title,
        color:color
      }
      expect(@label.to_hash).to eq fake_label_hash
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(@label.title).to eq title
    end
  end

  describe '#color' do
    it 'returns the correct color' do
      expect(@label.color).to eq color
    end
  end
end
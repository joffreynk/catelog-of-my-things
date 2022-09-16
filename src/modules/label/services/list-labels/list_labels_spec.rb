require_relative './list_labels_service'
require_relative '../../../../shared/repositories/memory_repository'

describe ListLabelsService do
  before(:each) do
    @labels_repository = MemoryRepository.new
    @list_labels_service = ListLabelsService.new(@labels_repository)
  end

  it 'should be able to list all available labels' do
    num_labels_to_create = 3
    fake_labels = []

    num_labels_to_create.times do |i|
      fake_label = {
        title: "full stuck #{i + 1}",
        color: "red #{i + 1}"
      }

      @labels_repository.save(fake_label)
      fake_labels.push(fake_label)
    end

    result = @list_labels_service.execute

    expect(result.length).to eq(num_labels_to_create)
    expect(result).to match_array(fake_labels)
  end
end

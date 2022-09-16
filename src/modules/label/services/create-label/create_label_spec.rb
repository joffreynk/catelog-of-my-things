require_relative './create_label_service'
require_relative '../../../../shared/repositories/memory_repository'

describe CreateLabelService do
  before(:each) do
    @labels_repository = MemoryRepository.new
    @create_label_service = CreateLabelService.new(@labels_repository)
  end

  it 'should be able to create a new label' do
    title = 'John'
    color = 'blue'

    new_label = @create_label_service.execute(
      title: title,
      color: color
    )
    labels = @labels_repository.fetch_all

    expect(labels.length).to eq(1)
    expect(new_label).to have_attributes(title: title)
    expect(new_label).to have_attributes(color: color)
  end
end
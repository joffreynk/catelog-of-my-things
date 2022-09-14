require_relative '../components/label_component'
require_relative '../components/ordered_list_component'

class LabelManager
  def initialize(create_label:, list_labels:)
    @create_label = create_label
    @list_labels = list_labels
  end

  def handle_create_label
    title = get_user_input('Enter the label\'s title: ')
    color = get_user_input('Enter the label\'s color: ')

    response = @create_label.call(
      title: title,
      color: color
    )

    if response[:success]
      new_label = response[:data]

      print_message('New label added successfuly')
      puts 'The new label added:'
      label_component = LabelComponent.new(new_label)
      label_component.render
    else
      print_message("Error: #{response[:error]}")
    end
  end

  def handle_list_labels
    response = @list_labels.call

    if response[:success]
      labels = response[:data]

      if labels.empty?
        puts 'No labels available.'
      else
        labels_str = labels.map { |label| LabelComponent.new(label).to_string }
        ordered_list = OrderedListComponent.new(labels_str)
        ordered_list.render
      end
    else
      print_message("Error: #{response[:error]}")
    end
  end
end
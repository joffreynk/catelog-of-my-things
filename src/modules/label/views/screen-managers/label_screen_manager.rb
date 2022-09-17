require_relative '../components/label_component'
require_relative '../../../../shared/views/screen-managers/entity_screen_manager'

class LabelScreenManager < EntityScreenManager
  def initialize(create_label:, list_labels:)
    super(list_all: list_labels, component_class: LabelComponent)
    @create_label = create_label
  end

  def handle_create_label
    handle_errors do
      title = get_user_input('Enter the label\'s title: ')
      color = get_user_input('Enter the label\'s color: ')

      new_label = @create_label.call(
        title: title,
        color: color
      )

      print_success_entity_creation('label', new_label)
    end
  end

  def handle_list_labels
    handle_list_all('No labels available.')
  end
end

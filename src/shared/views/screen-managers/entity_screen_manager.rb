require_relative '../components/ordered_list_component'

class EntityScreenManager
  def initialize(list_all:, component_class:)
    raise 'Abstract classes can\'t be instantiated.' if instance_of?(EntityScreenManager)

    @list_all = list_all
    @component_class = component_class
  end

  def empty?
    handle_errors do
      entities = @list_all.call
      entities.empty?
    end
  end

  private

  def handle_list_all(empty_message)
    handle_errors do
      entities = @list_all.call

      if entities.empty?
        puts empty_message
      else
        entities_str = entities.map { |entity| @component_class.new(entity).to_string }
        ordered_list = OrderedListComponent.new(entities_str)
        ordered_list.render
      end
    end
  end

  def print_success_entity_creation(entity_type, entity_created)
    print_message("New #{entity_type} added successfuly")
    puts "The new #{entity_type} added:"
    entity_component = @component_class.new(entity_created)
    entity_component.render
  end

  def handle_errors
    yield
  rescue StandardError => e
    print_message("Error: #{e.message}")
  end
end

require_relative './component'
require_relative './ordered_list_component'
require_relative '../../utils/console.utils'

class MenuComponent < Component
  def to_string
    ordered_list = OrderedListComponent.new(@data, lambda { |n| "[#{n}] "})
    ordered_list.to_string
  end

  def get_user_option
    input = get_user_input('Please select a option number, then press [ENTER]: ').to_i
    if not_out_bounds?(input)
      input
    else
      puts 'Invalid option!'
      nil
    end
  end

  def not_out_bounds?(input)
    input.positive? && input <= @data.length
  end
end

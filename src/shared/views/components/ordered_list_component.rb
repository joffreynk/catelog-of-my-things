require_relative './component'

class OrderedListComponent < Component
  def initialize(data, wrap_number = ->(n) { "#{n}- " })
    @wrap_number = wrap_number
    super(data)
  end

  def to_string
    @data.map.with_index do |item, index|
      line = item.is_a?(Array) ? item[0] : item
      "#{@wrap_number.call(index + 1)}#{line}"
    end
  end
end

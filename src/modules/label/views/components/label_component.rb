require_relative '../../../../shared/views/components/component'

class LabelComponent < Component
  def to_string
    "ID: #{@data.id} | title: #{@data.title} | color: #{@data.color}"
  end
end

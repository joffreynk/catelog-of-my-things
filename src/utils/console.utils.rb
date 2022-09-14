def get_user_input(message)
  print message
  gets.chomp
end

def gen_frame(lines_to_print, padding)
  frame = []
  longest_line = lines_to_print.max { |a, b| a.length <=> b.length }
  border_top_str = '╔'
  border_bottom_str = '╚'
  border_width = longest_line.length + (padding * 2)

  border_width.times do
    border_top_str << '═'
    border_bottom_str << '═'
  end

  border_top_str << '╗'
  border_bottom_str << '╝'

  frame.push(border_top_str)

  lines_to_print.each do |line|
    content_left = "║#{' ' * padding}"
    content_right = "#{' ' * (padding + longest_line.length - line.length)}║"
    frame.push(content_left + line + content_right)
  end

  frame.push(border_bottom_str)
  frame
end

def print_message(msg)
  puts gen_frame([msg], 5)
end
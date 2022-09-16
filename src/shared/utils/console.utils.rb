require 'date'

def get_user_input(message)
  print message
  gets.chomp.strip
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

def bind_frame_down(frame, frame_to_bind)
  return frame_to_bind if frame.empty?
  return frame if frame_to_bind.empty?

  frame[-1][0] = '╠'
  frame[-1][-1] = '╣'
  frame_to_bind.delete_at(0)

  frame + frame_to_bind
end

def gen_frames(lines_set_array, padding)
  if lines_set_array[0].is_a?(Array)
    frames = lines_set_array.reduce([]) do |acc, lines_set|
      frame = gen_frame(lines_set, padding)
      bind_frame_down(acc, frame)
    end
    frames
  else
    gen_frame(lines_set_array, padding)
  end
end

def print_message(msg)
  puts gen_frame([msg], 5)
end

def bool_to_string(boolean)
  boolean ? 'yes' : 'no'
end

def get_date_input(message)
  loop do
    input_date = get_user_input(message)

    year, month, day = input_date.split('-')
    return input_date if Date.valid_date?(year.to_i, month.to_i, day.to_i)

    print_message('Invalid Date! Please, enter a date in this format YYYY-MM-DD.')
  end
end

def read_file(file_path)
  file = File.open(file_path)
  data = file.read
  file.close
  data
end

def write_file(file_path, data)
  file = File.open(file_path, 'w')
  file.write(data)
  file.close
end
end

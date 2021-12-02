ARGF.each_line.each_with_index do |l, i|
  puts "#{i + 2000} data #{l}"
end

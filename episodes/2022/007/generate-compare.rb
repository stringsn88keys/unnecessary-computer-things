SNIPPET = <<~SNIPPET.freeze
  ti$="000000"
  :xvar=:startvalue :yvarclause
  for i=1 to 1000
  :xvar=:xvar+:yvar
  next i
  print ti;"<= :description"
SNIPPET

tuples = %w[
  x 1 0
  x% 1 0
  x y 0
  x% y% 0
  x1 1 0
  x% 1 0
  x1 y1 0
  x 1 30000
  x% 1 30000
  x y 30000
  x% y% 30000
  x1 1 30000
  x% 1 30000
  x1 y1 30000

]

class BasicWriter
  attr_accessor :line_number
  attr_reader :line_increment

  def initialize(starting_line = 100, line_increment = 10)
    @line_number = starting_line
    @line_increment = line_increment
  end

  def write_line(string)
    puts "#{line_number} #{string}"
    self.line_number += 10
  end
end

def sub_by_pair(line, tuple)
  yvarclause = tuple[1] == '1' ? '' : ":#{tuple[1]}=1"
  description = "#{tuple[0]} += #{tuple[1]}, start #{tuple[2]}"
  line = line.gsub(':xvar', tuple[0]).gsub(':yvarclause', yvarclause).gsub(':yvar', tuple[1])
  line = line.gsub(':startvalue', tuple[2])
  line.gsub(':description', description)
end

writer = BasicWriter.new

tuples.each_slice(3) do |tuple|
  SNIPPET.each_line do |line|
    writer.write_line(sub_by_pair(line, tuple))
  end
end

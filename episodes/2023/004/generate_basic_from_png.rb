require 'chunky_png'

# http://www.libpng.org/pub/png/spec/1.2/PNG-Chunks.html

class ReducedCanvas
  attr_accessor :height, :width, :pixels

  ## canvas should have a height/width and pixels of scanlines in a single
  def initialize(canvas, new_height, new_width)
    @height = new_height
    @width = new_width
    @pixels = []
    convert(canvas)
  end

  private

  def traverse_grid(rows, cols, method: :each)
    (0..rows - 1).send(method) do |row|
      (0..cols - 1).send(method) do |col|
        yield row, col
      end
    end
  end

  def pixel_at(canvas, row, column)
    row * canvas.width + column
  end

  def convert(canvas)
    traverse_grid(height, width) do |row, col|
      mark = traverse_grid(canvas.height / height, canvas.width / width, method: :any?) do |r, c|
        pixel_at(canvas, row + r, col + c) != 0
      end
      @pixels << mark
    end
  end
end

ARGV.each do |filename|
  basename = File.basename(filename, '.png')
  puts "Processing #{basename}.png ..."

  png_stream = ChunkyPNG::Datastream.from_file(filename)
  png_stream.each_chunk do |chunk|
    p chunk
  end

  ## https://github.com/wvanbergen/chunky_png/blob/master/lib/chunky_png/canvas/png_decoding.rb
  canvas = ChunkyPNG::Canvas.from_file(filename)
  puts canvas.instance_variables

  # canvas.pixels.height
  # canvas.pixels.width
  reduced_canvas = ReducedCanvas.new(canvas, 48, 128)

  reduced_canvas.pixels.each_with_index do |pixel, index|
    print pixel ? '*' : ' '
    puts if index % 128 == 127
  end

  p canvas.pixels
end

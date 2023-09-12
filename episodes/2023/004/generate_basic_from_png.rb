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
    # traverse the rows and columns of the reduced canvas
    data_size = canvas.height / height * canvas.width / width
    traverse_grid(height, width) do |row, col|
      # traverse the rows and columns of the candidate cell
      sum = traverse_grid(canvas.height / height, canvas.width / width).inject([0,0,0,0]) do |a, r, c|
        pixel = pixel_at(canvas, row * (canvas.height / height) + r, col * (canvas.width / width) + c)
        a[0] += (pixel & 0xff000000) >> 24
        a[1] += (pixel & 0x00ff0000) >> 16
        a[2] += (pixel & 0x0000ff00) >> 8
        a
      end
      mark = [a[0] / data_size, a[1] / data_size, a[2] / data_size, a[3] / data_size].any? { |c| c > 0x80 } ? true : false
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

#p  reduced_canvas.pixels
  reduced_canvas.pixels.each_with_index do |pixel, index|
    print pixel ? '*' : '-'
    puts if index % 128 == 127
  end

  # p canvas.pixels
end

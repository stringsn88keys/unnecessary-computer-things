require 'chunky_png'

# Function to convert a pixel to monochrome (black or white)
def to_monochrome(pixel)
  r = ChunkyPNG::Color.r(pixel)
  g = ChunkyPNG::Color.g(pixel)
  b = ChunkyPNG::Color.b(pixel)

  # Convert to grayscale using luminosity method
  grayscale = (0.21 * r + 0.72 * g + 0.07 * b).round
  grayscale >= 128 ? true : false # "true" is black (on), "false" is white (off)
end

# Load the image
def convert_image_to_monochrome_array(file_path)
  image = ChunkyPNG::Image.from_file(file_path)

  # Scale to 640x240
  width = 640
  height = 240

  scaled_image = ChunkyPNG::Image.new(width, height)

  (0...width).each do |x|
    (0...height).each do |y|
      orig_x = (x.to_f / width * image.width).to_i
      orig_y = (y.to_f / height * image.height).to_i
      scaled_image[x, y] = image[orig_x, orig_y]
    end
  end

  # Collect coordinates for "on" pixels
  toggle_coordinates = []
  last_pixel=false
  last_coord=nil
  (0...height).each do |y|
    (0...width).each do |x|
      pixel = scaled_image[x, y]

      current_on_off = to_monochrome(pixel)
      if current_on_off != last_pixel
        if last_coord
          toggle_coordinates << (x + y * width) - last_coord
        else
          toggle_coordinates << x + y * width
        end
        last_pixel=current_on_off
        last_coord = x + y * width
      end
    end
  end

  toggle_coordinates
end

# Output the array of coordinates to be "on"
def output_on_coordinates(file_path)
  convert_image_to_monochrome_array(file_path).each_slice(32).each_with_index do |slice, i|
    puts "#{i*10 + 190} DATA #{slice.flatten.join(",")}"
  end
  puts "99999 DATA -1,-1"

end

# Input PNG file path
input_file = 'simpsons.png'

puts File.read("basic_template_switch_gap.bas")
# Output on coordinates
output_on_coordinates(input_file)

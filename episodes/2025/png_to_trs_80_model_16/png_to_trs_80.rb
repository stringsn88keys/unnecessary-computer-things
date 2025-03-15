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
  # width = 640
  width = 160
  # height = 240
  height = 60
  scaled_image = ChunkyPNG::Image.new(width, height)

  (0...width).each do |x|
    (0...height).each do |y|
      orig_x = (x.to_f / width * image.width).to_i
      orig_y = (y.to_f / height * image.height).to_i
      scaled_image[x, y] = image[orig_x, orig_y]
    end
  end

  # Collect coordinates for "on" pixels
  on_coordinates = []
  (0...width).each do |x|
    (0...height).each do |y|
      pixel = scaled_image[x, y]
      if to_monochrome(pixel)
        on_coordinates << [x, y] # Add coordinates where pixel is "on" (black)
      end
    end
  end

  on_coordinates
end

# Output the array of coordinates to be "on"
def output_on_coordinates(file_path)
  convert_image_to_monochrome_array(file_path).each_slice(36).each_with_index do |slice, i|
    puts "#{i*10 + 110} DATA #{slice.flatten.join(",")}"
  end
  puts "99999 DATA -1,-1"

end

# Input PNG file path
input_file = 'simpsons.png'

puts File.read("basic_template.bas")
# Output on coordinates
output_on_coordinates(input_file)

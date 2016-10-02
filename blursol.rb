t1= Time.new
require "pp"
class Image
  def initialize bitmap
    @bitmap = bitmap
  end

  def output_image
    @bitmap.each_with_index do |x, i|
      puts "#{i} #{x.join}"
    end
  end

  def transform dist
    ones = find_ones

    ones.each do |pos|
      by, bx = pos

      (0..dist).each do |oy|
        (0..(dist-oy)).each do |ox|
          plot_point by+oy, bx+ox
          plot_point by-oy, bx+ox
          plot_point by+oy, bx-ox
          plot_point by-oy, bx-ox
        end
      end
    end
  end

  private

  def find_ones
    ones = []

    @bitmap.each_with_index do |row, y|
      row.each_with_index do |bit,x|
        ones << [y,x] if bit == 1
      end
    end

    ones
  end

  def plot_point y, x
    return if x < 0
    return if y < 0
    return if y >= @bitmap.length
    return if x >= @bitmap[y].length

    # track operations. use = 1 for std behavior
    @bitmap[y][x] = 1
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 1, 0],
  [0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0]
])

#image.output_image
#puts
image.transform 3
#image.output_image

t2= Time.new

pp t2 - t1
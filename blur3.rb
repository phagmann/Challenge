require 'pp'
t1= Time.new
class Image
    attr_accessor :list
    def initialize(list)
        self.list=list
    end

    def output_image
        list.each do |row|
            puts row.join
        end
    end
    #puts list[1].length
    #puts list.transpose[1].length

    def transforms
        new_list=list.transpose.transpose
        list.each_with_index do |row,row_index|
            row.each.each_with_index do |col, col_index|
                next if list[row_index][col_index] != 1
                new_list[row_index][col_index-1] = 1 if col_index -1 >= 0
                
                new_list[row_index-1][col_index] = 1 if row_index - 1 >= 0
              
                new_list[row_index][col_index+1] = 1 if col_index +1 < list[1].length
                
                
                new_list[row_index+1][col_index] = 1 if row_index+1 < list.length
                
            end
        end
        Image.new(new_list)
    end

end

def manhattan(image,n)
    if n == 0
        return image.output_image
    end
    while n>0
        image=image.transforms
        n=n-1
    end
    return image.output_image
end
# array[down][across]


image = Image.new([
  [0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

])
manhattan(image,5)
puts ""

t2= Time.new

pp t2 - t1
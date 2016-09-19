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

    def blur(dist)
        new_ones=[] 
        rotation= [[1,1],[1,-1],[-1,-1],[-1,1]]
        @list.each_with_index do |row,row_index| # iterates through each row by index
            row.each_with_index do |col, col_index| # iterates through each column by index 
                next if @list[row_index][col_index] != 1 || new_ones.include?( [row_index,col_index] ) #checks if the current iterative stop doesn't contains a 1
                # ^ also checks if it is an original 1. newly created 1's are marked in the array "new_ones" by index locations
                (-dist..0).each do |radius| #This starts the spiral check. each itration decreases the dimond radius
                    x = radius + row_index
                    y = col_index
                    rotation.each do |distance| # dimonds have 4 outer edges, which is represented with "rotation"
                        (radius+1..0).each do |m| #iterates through the current spot in the spiral search                  
                            if x  >= 0 and x < @list.length  and y  >= 0 and y < @list[1].length # checks if bounderies are legal
                                new_ones << [x,y] if @list[x][y] == 0 #adds new 1 index's if the coordinates are a zero
                                @list[x][y] = 1
                            end
                            x = x + distance[0]
                            y = y + distance[1]
                        end
                    end
                end
            end
        end
    end

end



image = Image.new([
  [0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
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
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]

])

#image.output_image
#puts ""
Image.new(image.blur(5)).output_image
puts ""
t2= Time.new

pp t2 - t1
    

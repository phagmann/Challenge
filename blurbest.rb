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
        vv= [[1,1],[1,-1],[-1,-1],[-1,1]]
        @list.each_with_index do |row,row_index|
            row.each_with_index do |col, col_index|
                next if @list[row_index][col_index] != 1 || new_ones.include?( [row_index,col_index] )
                counter=0
                (-dist..0).each do |radius|
                    x = radius + row_index
                    y = col_index
                    vv.each do |distance|
                        (radius+1..0).each do |m|                 
                            if x  >= 0 and x < @list.length  and y  >= 0 and y < @list[1].length
                                new_ones << [x,y] if @list[x][y] == 0  
                                @list[x][y] = 2
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
    

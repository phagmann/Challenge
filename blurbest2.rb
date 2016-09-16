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
        vv= [[1,1],[1,-1],[-1,-1],[-1,1]]
        @list.each_with_index do |row,row_index|
            row.each_with_index do |col, col_index|
                next if @list[row_index][col_index] != 1
                (-dist..0).each do |radius|
                    x = radius + row_index
                    y = col_index
                    vv.each do |distance|
                        (radius+1..0).each do |m|                 
                            if x  >= 0 && x < @list.length  && y  >= 0 && y < @list[1].length
                                if row_index>0 && @list[x][y]!=1 && row_index > x
                                    @list[x][y] = 1
                                elsif @list[x][y] == 0  
                                    @list[x][y] = 2

                                end
                            end
                            x = x + distance[0]
                            y = y + distance[1]
                        end
                    end
                end
            end
            #turn 2's into 1's
            @list[row_index]=row.map{|x|x == 2 ? 1 : x}
        end
    end

end



image = Image.new([
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
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
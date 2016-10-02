require 'pp'
t1= Time.new
def two_d(r,c)

  master=[]
  r.times do |r_index|
    row=[]
    c.times do |c_index|
      rand= rand(1..11)
      if rand >= 9
        row << 1
      else
        row << 0
      end
    end
    master << row
  end
  return master
end
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
        rotation= [ [1,1],[1,-1],[-1,-1],[-1,1] ]
        @list.each_with_index do |row,row_index| # iterates through each row by index
            row.each_with_index do |col, col_index| # iterates through each column by index
                next if @list[row_index][col_index] != 1 #checks if the current iterative stop doesn't contains a 1
                (-dist..0).each do |radius| #This starts the spiral check. each itration decreases the dimond radius
                    x = radius + row_index
                    y = col_index
                    rotation.each do |distance| # dimonds have 4 outer edges, which is represented with "rotation"
                        (radius+1..0).each do |m|  #iterates through the current spot in the spiral search               
                            if x  >= 0 && x < @list.length  && y  >= 0 && y < @list[1].length # checks if bounderies are legal
                                if row_index>0 && @list[x][y]!=1 && row_index > x #checks if the spot is an original 1
                                    @list[x][y] = 1
                                elsif @list[x][y] == 0  
                                    @list[x][y] = 2 #turns to a 2 if it was a zero since 1's at this stage mean origial.

                                end
                            end
                            x = x + distance[0]
                            y = y + distance[1]
                        end
                    end
                end
            end
            #wanted to play with the .map extention. Turns all the 2's into 1's
            @list[row_index]=row.map{|x|x == 2 ? 1 : x}
        end
    end

end


image= Image.new(two_d(8,8))
Image.new(image.blur(3))
puts ""
t2= Time.new

pp t2 - t1
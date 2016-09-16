require 'pp'
class Image
    attr_accessor :list
    def initialize(list)
        self.list=list
    end

    def output_image
        list.each do |row|
          rows=""
          row.each do |col|
            rows=rows + col.to_s
          end
          rows.to_i
          puts rows
        end
    end
    #puts list[1].length
    #puts list.transpose[1].length
    def transforms
        new_list=list.transpose.transpose
        row_index=-1
        list.each do |row|
            row_index=row_index+1
            col_index=-1
            row.each do |col|
                col_index=col_index+1
            if list[row_index][col_index] == 1
                if row_index >=0  and col_index -1>= 0
                    new_list[row_index][col_index-1]=1
                end
                if row_index-1 >= 0 and col_index >= 0
                    new_list[row_index-1][col_index]=1
                end
                if row_index < list.transpose[row_index].length and col_index +1< list[col_index].length
                    new_list[row_index][col_index+1]=1
                end
                if row_index+1 < list.transpose[row_index].length and col_index < list[col_index].length
                    new_list[row_index+1][col_index]=1
                end
            end

            end

        end
        Image.new(new_list)
    end
end

# array[down][across]


image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
])
pp image
puts "Before"
image.output_image
puts "After"
iii=image.transforms
pp iii
iii.output_image


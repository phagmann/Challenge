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

end

v= [
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1]
]
#puts v[1].length
#puts v.transpose[1].length
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
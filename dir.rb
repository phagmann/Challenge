require 'pp'
def dirReduc(arr)
  oops= { "NORTH" => "SOUTH", "SOUTH" => "NORTH", "EAST" => "WEST", "WEST" => "EAST"}
  index=1
  while index < arr.size
    if oops[arr[index]] == arr[index-1]
      arr.delete_at(index)
      arr.delete_at(index-1)
      next
    elsif oops[arr[index]] == arr[index+1]
      arr.delete_at(index)
      arr.delete_at(index)
      next
    end
    index=index+1
  end
  return arr
end


a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
puts dirReduc(a)
u=["NORTH", "WEST", "SOUTH", "EAST"]
pp dirReduc(u)

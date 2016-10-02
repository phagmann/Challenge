require "pp"
class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end
 
def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else      
    print "nil\n"
    return
  end
end
count =4
birth= LinkedListNode.new(rand(1..101))
node1 = LinkedListNode.new(rand(1..101),birth)
while count > 0
  node1 = LinkedListNode.new(rand(1..101), node1)
  count = count - 1
end

birth.next_node = node1

#print_values(node1)
#pp node1


def ifloop(list)

  tortoise = list
  hare = list
  while list
    return "No Loop Found!" if hare.next_node == nil
  
    hare=hare.next_node

    return "No Loop Found!" if hare.next_node == nil

    return "Loop Found!" if hare.next_node == tortoise.next_node

    hare = hare.next_node

    tortoise = tortoise.next_node

  end



end

print ifloop(node1)

# tortoise := firstNode
# hare := firstNode

# forever:

#   if hare == end 
#     return 'No Loop Found'

#   hare := hare.next

#   if hare == end
#     return 'No Loop Found'
#    if hare==tortoise
# return true

#   hare = hare.next
#   tortoise = tortoise.next

#   if hare == tortoise
#     return 'Loop Found'
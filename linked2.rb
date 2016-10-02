require 'pp'
class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

end

 ############################################


#############################################

 def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else      
    print "nil\n"
    return
  end
end

def reverse_list(list, previous = nil)   
    #previous_next_node = not defined yet
    #list = 12 99 37 nil
    #previous = nil

    loop do
        previous_next_node = list.next_node 
        #previous_next_node = 99 37 nil
        #list = 12 99 37 nil
        #previous = nil
        list.next_node = previous 
        #previous_next_node = 99 37 nil
        #list = 12 nil
        #previous = nil
        previous = list 
        #previous_next_node = 99 37 nil
        #list = 12 nil
        #previous = 12 nil
        return list if previous_next_node == nil
        list = previous_next_node
        #previous_next_node = 99 37 nil
        #list = 99 37 nil
        #previous = 12 nil
    end
end


def reverse_list_with_mutation(list)
 new_tail = nil
 new_head = list
 loop do
   rest = new_head.next_node
   new_head.next_node = new_tail
   if rest
     new_tail = new_head
     new_head = rest
   else
     break
   end
 end

new_head
end


def reverse_list3(list)  
    reversed= nil
    while list
        reversed=LinkedListNode.new(list.value,reversed) 
        list = list.next_node         
    end
    return reversed
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)




print_values(node3)
#reverse_list(node4).print_stack
print_values(reverse_list(node3))


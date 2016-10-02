
add_numbers = lambda do |num1,num2|
    return num1 + num2
end

subtract_numbers= lambda do |num1, num2|
    return num1 - num2
end

def combine(m, num1, num2)
    return m.call(num1,num2)
end

puts combine(add_numbers, 3, 4)
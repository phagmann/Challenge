class Animal
    def eat
        puts "om nom nom nom"
    end
end


class Dog < Animal
    def bark
        puts "woof"
    end
end

class Cat < Animal
    def meow
        puts "meow meow meow"
    end

end

class Duck < Animal
    def quack
        puts "quack"
    end

end


class GoldenRetriever < Dog
    def fetch
        puts "go fetch!"

    end
end

class Poodle < Dog


end

animal = Animal.new


dog = Dog.new


cat = Cat.new


duck = Duck.new


gr = GoldenRetriever.new

puts gr.is_a?(Animal)

class Person
  attr_reader :age, :name
  def initialize(name,age)
    @name= name
    @age = age
  end

end

ken = Person.new("Ken", 28)
marco = Person.new("Marco", 31)
erica = Person.new("Erica", 29)
cindy = Person.new("Cindy", 14)

people = [ken, marco, erica, cindy]

def sort_people(people, comparer)
    people.sort do |x,y|
        comparer.call(x) <=> comparer.call(y)
    end
end


sorted_people = sort_people(people, 
    lambda { |person|
    person.name})

puts sorted_people.inspect
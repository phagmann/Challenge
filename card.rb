class Card
    attr_accessor :rank, :suit
    def initialize(rank, suit)
        self.rank=rank
        self.suit=suit
    end

    def output_card
        puts " #{self.rank} of #{self.suit}"
    end
    def self.random_card
        self.new(rand(10), :spades)
    end

end
#puts Card.random_card
class Deck
    def initialize
        @cards = []
        @cards << Card.new(10, :spades)
        @cards << Card.new(6, :spades)
        @cards << Card.new(3, :spades)
    end

    def shuffle
        @cards.shuffle!
    end
    def output

        @cards.each do |card|
            card.output_card
        end

    end
    def deal 
        top = @cards.shift
        puts top.output_card
    end

end

deck= Deck.new
deck.shuffle
puts ""
puts "Current Deck"
deck.output
puts ""
puts "Below is card thats delt"
deck.deal
puts "New Deck"
deck.output
puts ""
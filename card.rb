class Cards
attr_reader :cards

    @@default_cards = ["a", "a","k", "k", "q", "q", "j", "j", 10, 10, 9, 9 , 8, 8 , 7, 7]
    def self.to_s(arr)
        arr.map!(&:to_s)
    end

    def initialize
        @cards = Cards.to_s(@@default_cards)
    end
    
    # def delete(arr.)
   
    
end

c = Cards.new

p c.cards
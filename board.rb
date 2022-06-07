require_relative "card.rb"
require "byebug"

class Board 

    attr_reader :cards, :cards_grid, :empty_grid
    def initialize
        @cards_grid = Array.new(4) {Array.new(4, " ")}
        @cards = Cards.new
        @empty_grid = Array.new(4) {Array.new(4, " ")}
    end

    def populate
        @cards_grid.each_with_index do |subarray, i|
            subarray.each_with_index do |ele, i2|
                random_card = @cards.cards.sample
                @cards_grid[i][i2] = random_card
                @cards.cards.delete_at(@cards.cards.index random_card)
            end
        end
    
    end  

    def []=(pos, value)
        @cards_grid[pos[0]][pos[1]] = value
    end 
    
    def reveal_card(pos)
        return @cards_grid[pos[0]][pos[1]]
    end

    def hide(pos)
        return " "
    end

    # def self.hidden_cards_grid
    #     hidden = @cards_grid.map do |subarray|
    #         subarray.map do |ele|
    #             " "
    #         end
    #     end
    #     hidden
    # end

    def self.print_grid (grid)
        puts "  0 1 2 3"
        grid.each.with_index do |subarray, i|
            puts "#{i} " + subarray.join(" ")
        end
    end

    def render
        Board.print_grid(@empty_grid)
    end

    def cheat
        Board.print_grid(@cards_grid)
    end

    def reveal_index
        pos = gets.chompuy
        row , col = pos[0] , pos[1]
        @empty_grid[row][col] = reveal_card(pos)
        p self.render
    end

    def guessed_pos


    end 

end 

b = Board.new

p b.populate
p b.cards_grid
p b.cheat
p b.reveal_index([0,0])



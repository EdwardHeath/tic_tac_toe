class Game
    def initialize
        @board = Board.new
        @current_player = "X"
        @turn_counter = 1
        display
        take_turn
    end

    def display
        @board.display
    end

    def take_turn
        print "Player #{@current_player}'s turn. Please choose an empty space. "
        choice = gets.chomp.to_i
        while !@board.check_empty(choice - 1)
            print "Space not empty. Please choose again. "
            choice = gets.chomp.to_i
        end
        @board.move(choice - 1, @current_player)
        display
        if @board.check_winner != nil
            puts "Player #{@current_player} wins!"
        elsif @turn_counter == 9
            puts "Tie Game!"
        else
            @current_player == "X" ? @current_player = "O" : @current_player = "X"
            @turn_counter += 1
            take_turn
        end
    end
end

class Board
    def initialize
        @board = Array.new(9){|item| item + 1}
    end

    def display
        puts
        puts "#{@board[0]}|#{@board[1]}|#{@board[2]}"
        puts "-----"
        puts "#{@board[3]}|#{@board[4]}|#{@board[5]}"
        puts "-----"
        puts "#{@board[6]}|#{@board[7]}|#{@board[8]}"
        puts
    end

    def check_empty(space)
        return @board[space] != "X" && @board[space] != "O"
    end

    def move(space, player)
        @board[space] = player
    end
    
    def check_winner
        if @board[0] == @board[1] && @board[1] == @board[2]
            return @board[0]
        elsif @board[3] == @board[4] && @board[4] == @board[5]
            return @board[3]
        elsif @board[6] == @board[7] && @board[7] == @board[8]
            return @board[6]
        elsif @board[0] == @board[3] && @board[3] == @board[6]
            return @board[0]
        elsif @board[1] == @board[4] && @board[4] == @board[7]
            return @board[1]
        elsif @board[2] == @board[5] && @board[5] == @board[8]
            return @board[2]
        elsif @board[0] == @board[4] && @board[4] == @board[8]
            return @board[0]
        elsif @board[2] == @board[4] && @board[4] == @board[6]
            return @board[2]
        else
            return nil
        end
    end
end

game = Game.new

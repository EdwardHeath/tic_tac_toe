class Game
    def init
        @board = Board.new
    end

    def display
        @board.display
    end
end

class Board
    def init
        @board = [[0,0,0],
                  [0,0,0],
                  [0,0,0]]
    end

    def display
        puts "#{@board[0][0]}"
    end
end

game = Game.new

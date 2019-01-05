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
        @board = [0,0,0,
                  0,0,0,
                  0,0,0]
    end

    def display
        puts "#{@board[0]}|#{@board[1]}|#{@board[2]}
              -----
              #{@board[3]}|#{@board[4]}|#{@board[5]}
              -----
              #{@board[6]}|#{@board[7]}|#{@board[8]}"
    end
end

game = Game.new
game.display

board = Board.new
board.display

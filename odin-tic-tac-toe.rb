# There must be only 2 classes : Player and Board
# Player 1 and Player 2 are instances of Player
# At the beginning of the game an instance of the board is created and played on
# Board has methods to display the current state of the board, check if a move done
# by an instance of the Player class is valid, modifying it's state with the move
# of the player (could be 2 methods : valid number, available spot), checking 
# winning condition, declaring a winner
# player 1 plays with X, player 2 with O
# Board is displayed like this :
# [O][O][ ]
# [X][O][ ]
# [ ][ ][X]
# Where each spot correspond to a number like on a Numpad

class Player
  def initialize(name)
    @name = name
  end
end

class Board
  def initialize
    @board = []
  end

  def generate_board
    9.times { @board.push(' ') }
  end

  def clear_board
    @board = []
  end

  def display_board
    @displayed_board = "[#{@board[0]}], [#{@board[1]}], [#{@board[2]}]\n"\
                       "[#{@board[3]}], [#{@board[4]}], [#{@board[5]}]\n"\
                       "[#{@board[6]}], [#{@board[7]}], [#{@board[8]}]"
    puts @displayed_board
  end

end


player1 = Player.new('Player 1')
player2 = Player.new('Player 2')

game = Board.new
game.generate_board
game.display_board
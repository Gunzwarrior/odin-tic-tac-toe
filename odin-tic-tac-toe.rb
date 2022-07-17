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
# finish game_over and someone_won methods

class Player
@@players = []


  def self.players
    puts @@players
  end

  def self.engine
    while true
      @@players[0].play
      @@players[1].play
    end
  end

  def initialize(name, board)
    @name = name
    @board = board
    @@players.push(self)
  end

  def play
    @played = false
    while !@played
      print "#{@name} > "
      @board.check_input(gets.chomp)
      if @board.made_a_move
        @played = true
      end
    end
  end
end

class Board
  attr_reader :made_a_move

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
    @displayed_board = "[#{@board[6]}], [#{@board[7]}], [#{@board[8]}]\n"\
                       "[#{@board[3]}], [#{@board[4]}], [#{@board[5]}]\n"\
                       "[#{@board[0]}], [#{@board[1]}], [#{@board[2]}]"
    puts @displayed_board
  end

  def a_number?(string)
    string.to_i.to_s == string
  end

  def between_0_9?(string)
    string.to_i.positive? && string.to_i < 10
  end

  def valid_input?(spot)
    if a_number?(spot) && between_0_9?(spot)
      true
    else
      false
    end
  end

  def empty?(spot)
    @board[spot.to_i - 1] == ' '
  end

  def check_input(spot)
    @made_a_move = false
    if valid_input?(spot) && empty?(spot)
      @made_a_move = true
      update_board(spot)
      display_board
    elsif !valid_input?(spot)
      puts 'Please enter a number between 0 and 9'
    else
      puts 'This spot is taken, please enter another'
    end
  end
  
  def update_board(spot)
    @board[spot.to_i - 1] = "X"
  end

  def full_board?
    if @board.include?(' ')
      false
    else
      true
    end
  end

  def empty_board?
    test_array = []
    9.times { test_array.push(' ') }
    if @board == test_array
      true
    else
      false
    end
  end

  def winning_conditions
    @winning_conditions = [@board[0] == @board[1] && @board[0] == @board[2],
                           @board[3] == @board[4] && @board[3] == @board[5],
                           @board[6] == @board[7] && @board[6] == @board[8],
                           @board[0] == @board[3] && @board[0] == @board[6],
                           @board[1] == @board[4] && @board[1] == @board[7],
                           @board[2] == @board[5] && @board[2] == @board[8],
                           @board[0] == @board[4] && @board[0] == @board[8],
                           @board[6] == @board[4] && @board[6] == @board[2]]
  end

  def someone_won?
    return if empty_board?

    winning_conditions.each { |i| winning_conditions[i] ? true : false }
  end

  def game_over?
  end

end


game = Board.new
player1 = Player.new('Player 1', game)
player2 = Player.new('Player 2', game)


game.generate_board
game.display_board
game.check_input("")
game.check_input(" ")
game.check_input("qdf5")
game.check_input("9")
game.check_input("10")
game.check_input("5")
game.check_input("5")
game.check_input("0")
game.display_board
game.someone_won?
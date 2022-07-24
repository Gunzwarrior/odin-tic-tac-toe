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

  def initialize(name, board, mark)
    @name = name
    @board = board
    @mark = mark

  end

  def play
    @played = false
    while !@played
      print "#{@name} > "
      @board.check_input(gets.chomp, @mark)
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
    generate_board
  end

  def game_over?
    if someone_won?
      return true
    end
    if full_board?
      return true
    end
  end

  def check_input(spot, mark)
    @made_a_move = false
    if valid_input?(spot) && empty?(spot)
      @made_a_move = true
      update_board(spot, mark)
      display_board
    elsif !valid_input?(spot)
      puts 'Please enter a number between 1 and 9'
    else
      puts 'This spot is taken, please enter another'
    end
  end

  def someone_won?
    return if empty_board?

    winning_conditions.each do |condition|
      if condition
        return true
      end
    end
      return false
  end

  private

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

  def update_board(spot, mark)
    @board[spot.to_i - 1] = mark
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
    @winning_conditions = [@board[0] == @board[1] && @board[0] == @board[2] && @board[0] != ' ',
                           @board[3] == @board[4] && @board[3] == @board[5] && @board[3] != ' ',
                           @board[6] == @board[7] && @board[6] == @board[8] && @board[6] != ' ',
                           @board[0] == @board[3] && @board[0] == @board[6] && @board[0] != ' ',
                           @board[1] == @board[4] && @board[1] == @board[7] && @board[1] != ' ',
                           @board[2] == @board[5] && @board[2] == @board[8] && @board[2] != ' ',
                           @board[0] == @board[4] && @board[0] == @board[8] && @board[0] != ' ',
                           @board[6] == @board[4] && @board[6] == @board[2] && @board[6] != ' ']
  end


  def full_board?
    return true unless @board.include? (' ')
  end

end

class Engine

private

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    run_game
  end

  def run_game
    until @board.game_over?
    ending = 0
      @player1.play
        if @board.game_over? && @board.someone_won?
          ending = 1
          break
        elsif @board.game_over?
          break
        end
      @player2.play
      if @board.game_over?
        ending = 2
      end
    end
    result(ending)
  end

  def result(code)
    if code == 1
      puts 'Player 1 won'
    elsif code == 2
      puts 'Player 2 won'
    else
      puts "Draw"
    end
  end


end

game = Board.new
player1 = Player.new('Player 1', game, 'X')
player2 = Player.new('Player 2', game, 'O')
Engine.new(player1, player2, game)


# frozen_string_literal: true

require_relative '../odin_tic_tac_toe'

describe Player do
  subject(:player_test) { described_class.new('Player 1', game, 'X') }
  let(:game) { instance_double(Board) }

  describe '#play' do
  
    
    context 'when playing a valid move' do
      before do
        expect(game).to receive(:check_input)
        expect(game).to receive(:made_a_move).and_return(true)
      end

      it 'changes the value of "played"' do
        player_test.play
        played = player_test.instance_variable_get(:@played)
        expect(played).to be true
      end

      it 'completes loop and check #made_a_move once'
        player_test.play
        played = player_test.instance_variable_get(:@played)
        expect(played).to be true
        # does not work
    end
  
  end
end
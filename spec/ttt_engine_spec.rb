# frozen_string_literal: true

require_relative '../odin_tic_tac_toe'

describe Engine do
  subject(:engine_test) { described_class.new(player1, player2, game) }
  let(:game) { instance_double(Board) }
  let(:player1) { instance_double(Player) }
  let(:player2) { instance_double(Player) }

  describe '#run_game' do

    context 'When player 1 wins' do

      before do
        allow(player1).to receive(:play)
        allow(game).to receive(:game_over?).and_return(true)
        allow(game).to receive(:someone_won?).and_return(true)
      end

      it 'calls #result with "1"' do
        #work in progress
      end
    end
  end
end
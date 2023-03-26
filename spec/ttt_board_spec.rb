# frozen_string_literal: true

require_relative '../odin_tic_tac_toe'

describe Board do
  subject(:test_board) { described_class.new }
  describe '#someone_won?' do
    context 'when board is empty' do
      it 'returns nil' do
        allow(test_board).to receive(:empty_board?).and_return(true)
        expect(test_board.someone_won?).to be nil
      end
    end
    context 'when game is not won' do
      it 'returns false' do
        allow(test_board).to receive(:empty_board?).and_return(false)
        expect(test_board.someone_won?).to be false
      end
    end
    context 'when game is won' do
      # do not test because of spaghetti code
    end
  end
  describe '#check_input' do
    context 'when inputting a valid number on an empty spot' do
      before do
        allow(test_board).to receive(:valid_input?).with(3).and_return(true)
        allow(test_board).to receive(:empty?).and_return(true)
        allow(test_board).to receive(:update_board)
        allow(test_board).to receive(:display_board)
      end
      it 'makes a move' do
        test_board.check_input(3, 'x')
        move = test_board.instance_variable_get(:@made_a_move)
        expect(move).to be true
      end
      it 'update board once' do
        expect(test_board).to receive(:update_board).once
        test_board.check_input(3, 'x')
      end
      it 'displays board once' do
        expect(test_board).to receive(:display_board).once
        test_board.check_input(3, 'x')
      end
    end
    context 'when inputting a valid number on an occupied space' do
      before do
        allow(test_board).to receive(:valid_input?).with(3).and_return(true)
        allow(test_board).to receive(:empty?).and_return(false)
        allow(test_board).to receive(:puts)
      end
      it 'says the spot is taken' do
        expect(test_board).to receive(:puts).with('This spot is taken, please enter another')
        test_board.check_input(3, 'x')
      end
    end
    context 'when inputting an invalid number' do
      before do
        allow(test_board).to receive(:valid_input?).and_return(false)
        allow(test_board).to receive(:empty?).and_return(false)
        allow(test_board).to receive(:puts)
      end
      it 'prompts for a valid number' do
        expect(test_board).to receive(:puts).with('Please enter a number between 1 and 9')
        test_board.check_input(3, 'x')
      end
    end
  end
end

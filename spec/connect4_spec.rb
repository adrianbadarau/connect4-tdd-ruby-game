require 'spec_helper'

describe Board do
  describe '#new' do
    board = Board.new
    it 'Creates a new 6X6 grid'do
      expect(board).to be_an_instance_of Board
      expect(board.bord).to be_an_instance_of Array
      expect(board.bord.size).to eq 6
    end
  end
end

describe Player do
  describe '#new' do
    it 'Creates a new player' do
      expect(lambda {Player.new}).to raise_error ArgumentError
    end
    it 'expects player to have a name and symbol' do
      player = Player.new('Adrian', 'X')
      expect(player.name).to eq 'Adrian'
      expect(player.symbol).to eq 'X'
    end
  end

  describe '#move' do
    before(:all) do
      @player = Player.new('Adrian', 'X')
      @board = Board.new.bord
    end
    context 'the collon is empty' do
      it 'adds the simbol to the bottom' do
        board = @player.move(0, @board)
        expect(board[5][0]).to eq 'X'
      end
    end
    context 'the collon is full' do
      it 'give an msg to inform the player' do
        6.times do
          board = @player.move(0, @board)
        end
        expect(lambda{@player.move(0, @board)}).to output(/That row is full/).to_stdout
      end
    end
  end
  describe '#win' do

    it 'checkes both diagonaly and orizontaly for a win condition' do
        @player = Player.new('Adrian', 'X')
        @board = Board.new.bord
      4.times do
        @player.move(0, @board)
        @player.move(1, @board)
        @player.move(2, @board)
        @player.move(3, @board)
        @player.move(4, @board)
      end
        move = @player.move([2,3], @board)
      expect(@player.win?(move, @board)).to be_true
    end
  end
end
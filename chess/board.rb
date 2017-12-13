require_relative 'piece'
require_relative 'display'

class PieceError < StandardError
  puts 'no piece there'
end

class Board
  attr_reader :grid
  attr_accessor :start_pos, :end_pos

  def initialize
    @start_pos = nil
    @end_pos = nil
    @grid = Array.new(8) {Array.new(8)}
    @grid[0].map! {|col| col = Piece.new}
    @grid[1].map! {|col| col = Piece.new}
    @grid[-2].map! {|col| col = Piece.new}
    @grid[-1].map! {|col| col = Piece.new}

    @grid[0] = Rook.new, Knight.new, Bishop.new, King.new, Queen.new, Bishop.new,Knight.new,Rook.new
    (0..7).each do |col_idx|
      self[[1,col_idx]] = Pawn.new
    end

    (2..5).each do |row_idx|
      (0..7).each do |col_idx|
        self[[row_idx, col_idx]] = NullPiece.new
      end
    end

    @grid[7] = Rook.new,Knight.new,Bishop.new,Queen.new,King.new,Bishop.new,Knight.new,Rook.new
    (0..7).each do |col_idx|
      self[[6,col_idx]] = Pawn.new
    end

  end

  def move_piece(start_pos,end_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos


    piece = @grid[start_row][start_col]

    @grid[end_row][end_col] = piece
    @grid[start_row][start_col] = nil
    piece.pos = end_pos

  end



  def play
    display = Display.new(Board.new)
    display.run

  end



  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos,piece)
    row,col = pos
    @grid[row][col] = piece
  end
end

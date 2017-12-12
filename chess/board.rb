require_relative 'piece'

class PieceError < StandardError
  puts 'no piece there'
end

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    @grid[0].map! {|col| col = Piece.new}
    @grid[1].map! {|col| col = Piece.new}
    @grid[-2].map! {|col| col = Piece.new}
    @grid[-1].map! {|col| col = Piece.new}
  end

  def move_piece(start_pos,end_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos

    if @grid[start_row][start_col].nil?
      raise PieceError
    end

    if @grid[end_row][end_col].is_a?(Piece)
      raise PieceError
    end

    piece = @grid[start_row][start_col]

    @grid[end_row][end_col] = piece
    @grid[start_row][start_col] = nil
    piece.pos = end_pos

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

board = Board.new
puts board.grid

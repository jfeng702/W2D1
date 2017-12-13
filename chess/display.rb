require 'byebug'
require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    # self.render(board, @cursor)
  end

  def render
    puts "   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |"
    puts "   ---------------------------------"
    # puts "0 | #{@board([0,0])} | #{@board([0,1])} | #{@board([0,2])} | #{@board([0,3])} | #{@board([0,4])} | #{@board([0,5])} | #{@board([0,6])} | #{@board([0,7])}"
    # puts @board[[0,0]]
    # puts @board.[]([0,0])
    # byebug
    @board.grid.each_with_index do |row, row_idx|
      # puts "#{row}\n"
      print " #{row_idx} |"
      # debugger
      row.each_with_index do |col, col_idx|
        if @cursor.cursor_pos == [row_idx, col_idx]
          # print @board[[row_idx, col_idx]].string.colorize(:blue)
          print ' x '.colorize(background: :red) + "|"
        else
          print ' x |'
        end

      end
      puts
      puts "   ---------------------------------"
    end
  end

  def run
    while true
    
      self.render
      @cursor.get_input
    end

  end
end

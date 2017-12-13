
module SlidingPiece
  def moves
    movement = {
      vertical: [[1,0],[-1,0]],
      horizontal: [[0,1],[0,-1]],
      diagonal: [[1,1],[-1,1],[1,-1],[-1,-1]]
    }

    possible_moves = []

  end

  def move_dirs
  end

  def horizontal_dirs
  end

  def diagonal_dirs
  end

  def grow_unblocked_moves_in_dir(dx,dy)
  end
end 

module SteppingPiece
  def moves
  end

  def move_diffs
  end
end

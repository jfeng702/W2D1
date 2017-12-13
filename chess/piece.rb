require_relative 'modules'

class Piece

  attr_accessor :pos

  def initialize
    @pos = [0,0]
  end

end

class NullPiece < Piece
  def initialize
  end
end


class King < Piece

  def initialize

  end

  def symbol
    return :K
  end

  def move_diffs

  end
end

class Queen < Piece

  def initialize

  end

  def symbol
    return :Q
  end

  def move_diffs

  end
end

class Pawn < Piece

  def initialize

  end

  def symbol
    return :P
  end

  def move_diffs

  end
end

class Rook < Piece

  def initialize

  end

  def symbol
    return :R
  end

  def move_diffs

  end
end

class Knight < Piece

  def initialize

  end

  def symbol
    return :k
  end

  def move_diffs

  end
end

class Bishop < Piece

  def initialize

  end

  def symbol
    return :B
  end

  def move_diffs

  end
end

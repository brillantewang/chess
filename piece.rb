class Piece
  attr_reader :type

  def initialize(type)
    @type = type
  end
end

class NullPiece < Piece
  
end

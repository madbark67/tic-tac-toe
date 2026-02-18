class Board
  def initialize
    @cells = Array.new(9,"-")
  end

  def win?
    # map out all winnings combinations and check if they hit
  end

  def draw?
    # only when board is full
  end

  def process_move(position, player_choice)
    if @cells[position] != "-"
      return false
    end
    @cells[position] = player_choice
    true
  end
end
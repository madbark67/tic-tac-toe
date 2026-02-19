class Board
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
  ]
  def initialize
    @cells = Array.new(9,"-")
  end

  def win?
    WIN_COMBINATIONS.any? do |combo|
      values = combo.map { |i| @cells[i]}
      if !values.include?("-") && values.uniq.length == 1
        return true
      end
    end
    false
  end

  def draw?
    # only when board is full
    if @cells.include?("-")
      return false
    end
    true
  end

  def process_move(position, player_choice)
    if @cells[position] != "-"
      return false
    end
    @cells[position] = player_choice
    true
  end

  def show_board 
    puts 
    puts "--+---+--"
    @cells.each_slice(3) do |row|
      puts row.join(" | ")
      puts "--+---+--"
    end
    puts
  end
end
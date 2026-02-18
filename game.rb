require_relative "board"
require_relative "player"

class Game 
  def initialize
    @board = Board.new()
    @players = []
    @current_index = 0
  end

  def play 
    @players << Player.new("Player 1", 'X')
    @players << Player.new("Player 2", 'O')

    while !@board.win? && !@board.draw?
      current_player = @players[@current_index]
      puts "#{current_player.name} select a spot you want to fill (1-9)"
      position = gets.chomp.to_i - 1
      valid = board.process_move(position, current_player.choice) 
      if !valid 
        puts "chosen spot is not valid"
        next
      end
      @current_index = 1 - @current_index
    end

    if @board.win?
      
    elsif @board.draw?
    
    end
  end
end
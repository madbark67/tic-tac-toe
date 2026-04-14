require_relative '../game'
require_relative '../board'
require_relative '../player'

RSpec.describe Game do
  describe "#initialize" do
    it "creates a board" do
      game = Game.new

      expect(game.board).to be_a(Board)
    end

    it "creates a player" do
      game = Game.new

      expect(game.players).to include(Player).twice
    end
  end

  describe "#player" do
    let(:game) {Game.new}
    it "switches players after a valid move" do
      allow(game).to receive(:gets).and_return("1")
      allow(game.board).to receive(:process_move).and_return(true)
      allow(game.board).to receive(:win?).and_return(false,true)
      allow(game.board).to receive(:draw?).and_return(false)

      game.play

      expect(game.current_index).to eql(1)
    end

    it "error when user puts an invalid position" do
      allow(game).to receive(:gets).and_return("10","2")
      allow(game.board).to receive(:process_move).and_return(false,true)
      allow(game.board).to receive(:win?).and_return(false,true)
      allow(game.board).to receive(:draw?).and_return(false)

      expect {game.play}.to output(/chosen spot is not valid/).to_stdout
    end
  end
end
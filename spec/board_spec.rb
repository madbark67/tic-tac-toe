require_relative "../board"

RSpec.describe Board do

  let(:board) {Board.new}
  describe "#initialize" do
    it "creates cell of array length 9" do
      expect(board.cells.length).to eq(9)
      expect(board.cells).to all(eql("-"))
    end
  end

  describe "#win?" do
    it "expects horizontal with X to be true" do
      board.cells[0] = "X"
      board.cells[1] = "X"
      board.cells[2] = "X"

      expect(board.win?).to eql(true)
    end

    it "expects vertical with X to be true" do
      board.cells[0] = "X"
      board.cells[3] = "X"
      board.cells[6] = "X"

      expect(board.win?).to eql(true)
    end

    it "expects diagonal with O to be true" do
      board.cells[0] = "O"
      board.cells[4] = "O"
      board.cells[8] = "O"

      expect(board.win?).to be(true)
    end

    it "expects mixed values to return false" do
      board.cells[0] = "O"
      board.cells[4] = "X"
      board.cells[8] = "O"

      expect(board.win?).to be(false)
    end

    it "expects '-' values to return false" do 
      board.cells[0] = "-"
      board.cells[4] = "-"
      board.cells[8] = "-"

      expect(board.win?).to eql(false)
    end
  end

  describe "#draw?" do
    it "expects empty board to return false" do
      expect(board.draw?).to be(false)
    end

    it "expects full board to return true" do
      board.cells.map! {|value| "X"}

      expect(board.draw?).to be(true)
    end

    it "expects partial filled board to return false" do
      board.cells[0] = "X"
      board.cells[3] = "O"
      expect(board.draw?).to be(false)
    end
  end

  describe "#process_move" do
    it "accepts a valid move" do
      result = board.process_move(0,"X")
      expect(result).to eql(true)
      expect(board.cells[0]).to eql("X")
    end

    it "does not accept an invalid move" do
      board.cells[0] = "X"
      result = board.process_move(0,"O")
      expect(result).to eql(false)
      expect(board.cells[0]).to eql("X")
    end
  end
end
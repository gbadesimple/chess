require_relative 'shared_examples_for_pieces'
require './lib/piece/whitepawn'

describe WhitePawn do
  let(:subject) { WhitePawn.new('white') }

  it_behaves_like 'a Piece'
  it_behaves_like 'a PieceSubclass'

  describe "#try_path(a,b,direction)" do
    context "when a path exists going from a to b in a given direction in one step" do
      it "returns the path as an array of coordinates" do
        a = [3,3]
        b = [3,4]
        direction = subject.up      
        result = [[3,3],[3,4]]
        expect(subject.try_path(a,b,direction)).to eql(result)
      end
    end

    context "when no path can be found in the given direction" do
      it "returns nil" do
        a = [3,3]
        b = [2,3]
        direction = subject.up
        expect(subject.try_path(a,b,direction)).to be nil
      end
    end

    context "when b can't be reached in one step" do
      it "returns nil" do
        a = [3,3]
        b = [3,5]
        direction = subject.up
        expect(subject.try_path(a,b,direction)).to be nil
      end
    end

    context "when b is outside of the board" do
      it "returns nil" do
        a = [0,7]
        b = [0,8]
        direction = subject.up
        expect(subject.try_path(a,b,direction)).to be nil
      end
    end
  end

  describe "#directions" do
    it "supplies the allowed directions" do
      directions = [
        subject.up
      ]
      expect(subject.directions).to match_array(directions)
    end
  end
end
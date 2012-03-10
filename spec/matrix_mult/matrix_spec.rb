require_relative "../spec_helper"

describe "Matrix" do
  let(:raw_matrix_one) { [[1,2,3],
                          [4,5,6]] }

  let(:raw_matrix_two) { [[1,2,3],
                          [1,5,1],
                          [1,5,1]] }

  let(:matrix_one) { MatrixMult::Matrix.new(raw_matrix_one) }
  let(:matrix_two) { MatrixMult::Matrix.new(raw_matrix_two) }

  describe "#initialize" do

    it "should set the numbers of rows and columns" do
      matrix_one.num_rows.should be(2)
      matrix_one.num_columns.should be(3)
    end
  end

  describe "#*" do
    let(:raw_answer) { [[6,27,8],
                        [15,63,23]] }

    let(:answer) { MatrixMult::Matrix.new(raw_answer) }
    let(:output) { matrix_one * matrix_two }

    it "should give the right answer" do
      output.should == answer
    end

  end

  describe "#get_coumn" do

    it "should get the column" do
      matrix_one.get_column(1).should == [2,5]
      matrix_one.get_column(2).should == [3,6]
    end
  end
end

require_relative "../spec_helper"

describe "Matrix" do
  let(:matrix_one) { [[1,2,3],
                      [4,5,6]] }

  let(:matrix_two) { [[1,2,3],
                      [1,5,1],
                      [1,5,1]] }

  describe "#initialize" do
    let(:matrix) { MatrixMult::Matrix.new(matrix_one) }

    it "should set the numbers of rows and columns" do
      matrix.num_rows.should be(2)
      matrix.num_columns.should be(3)
    end
  end

  describe "#*" do
  end

  describe "#get_coumn" do
    let(:matrix) { MatrixMult::Matrix.new(matrix_one) }

    it "should get the column" do
      matrix.get_column(1).should == [2,5]
      matrix.get_column(2).should == [3,6]
    end
  end
end

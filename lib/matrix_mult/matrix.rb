module MatrixMult
  class Matrix
    attr_accessor :array, :num_rows, :num_columns

    def initialize(array)
      @array = array
      @num_rows = @array.length
      @num_columns = @array.first.length
    end

    def *(matrix)
      output = Array.new(@num_rows) { Array.new(matrix.num_columns, 0) }
      @array.each_with_index do |row, row_num|
        row.each_with_index do |value, column_num|
          output[row_num][column_num] = mult_and_sum(row, matrix.get_column(column_num))
        end
      end

      MatrixMult::Matrix.new(output)
    end

    def ==(matrix)
      matrix.array == @array
    end

    def mult_and_sum(row, column)
      result = row.zip(column)
      result.map! {|elem| elem.first * elem.last}
      result = result.inject { |sum, value| sum += value }
    end


    def get_column(column_number)
      @array.map { |row| row[column_number] }
    end
  end
end

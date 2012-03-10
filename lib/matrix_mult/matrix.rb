module MatrixMult
  class Matrix
    attr_accessor :array, :num_rows, :num_columns

    def initialize(array)
      @array = array
      @num_rows = @array.length
      @num_columns = @array.first.length
    end

    def get_column(column_number)
      @array.map { |row| row[column_number] }
    end
  end
end

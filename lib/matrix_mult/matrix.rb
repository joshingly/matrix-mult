module MatrixMult
  class Matrix
    attr_accessor :array, :num_rows, :num_columns

    def initialize(array)
      @array = array
      @num_rows = @array.length
      @num_columns = @array.first.length
    end

    def *(matrix, num_threads = 1)
      num_threads = @num_rows if num_threads > @num_rows
      output = Array.new(@num_rows) { Array.new(matrix.num_columns, 0) }
      threads = []

      partitioned = partition(num_threads)

      num_threads.times do |part|

        threads << Thread.new do
          partitioned[part].each do |row_num|
            @array[row_num].each_with_index do |value, column_num|
              output[row_num][column_num] = mult_and_sum(@array[row_num], matrix.get_column(column_num))
            end
          end
        end

      end

      threads.each { |thread| thread.join }
      MatrixMult::Matrix.new(output)
    end

    def partition(number_of_parts)
      number_of_parts = @num_rows if number_of_parts > @num_rows
      partitioned_matrix = []
      partition_size = @num_rows / number_of_parts

      number_of_parts.times do |i|
        start = partition_size * i
        finish = partition_size * (i + 1) - 1
        finish = num_rows - 1 if i == number_of_parts - 1

        partitioned_matrix << (start..finish).to_a
      end

      partitioned_matrix
    end

    def ==(matrix)
      matrix.array == @array
    end

    def mult_and_sum(row, column)
      sum = 0
      result = row.zip(column) { |values| sum += (values.first * values.last) }

      sum
    end

    def get_column(column_number)
      @array.map { |row| row[column_number] }
    end
  end
end

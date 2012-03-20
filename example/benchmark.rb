require 'benchmark'
require_relative '../lib/matrix_mult'

time = Benchmark.realtime do
end

def do_benchmark(sample_size, matrix_size, threads)
  times = []

  sample_size.times do
    a = MatrixMult::Matrix.new(MatrixMult::Matrix.generate_random(matrix_size))
    b = MatrixMult::Matrix.new(MatrixMult::Matrix.generate_random(matrix_size))

    times << Benchmark.realtime do
      a.*(b, threads)
    end
  end

  sum = times.inject { |sum, x| sum += x }
  sum/sample_size
end

puts "one thread: #{do_benchmark(10, 300, 1)}"
puts "two threads: #{do_benchmark(10, 300, 2)}"
puts "four threads: #{do_benchmark(10, 300, 4)}"
puts "eight threads: #{do_benchmark(10, 300, 8)}"

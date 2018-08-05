require 'json'
require 'stringio'

def hourglassSum(arr)
  group_array1 = Array.new(4).map {Array.new(4, 0)}
  group_array2 = Array.new(4).map {Array.new(4, 0)}
  group_array3 = Array.new(4).map {Array.new(4, 0)}
  group_array = Array.new(4).map {Array.new(4, 0)}

  0.step(5, 1) {|i|
    0.step(5, 1) {|j|
      if (i <= 3 && j <= 3)
        group_array1[i][j] = arr[i][j..j + 2]
      end
      if ((i >= 1 && i <= 4) && (j >= 1 && j <= 4))
        group_array2[i - 1][j - 1] = arr[i][j..j + 0]
      end
      if (i >= 2 && j <= 3)
        group_array3[i - 2][j] = arr[i][j..j + 2]
      end
    }
  }
  0.step(3, 1) {|i|
    0.step(3, 1) {|j|
      group_array[i][j] = group_array1[i][j].sum + group_array2[i][j].sum + group_array3[i][j].sum
    }
  }
  p group_array.flatten.max
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

arr = Array.new(6)

6.times do |i|
  arr[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = hourglassSum arr

fptr.write result
fptr.write "\n"

fptr.close()
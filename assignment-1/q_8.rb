# Q. 8 ---Write a program to transpose an N*N matrix
#

puts "Enter the size of the matrix n: "
n = gets.chomp.to_i

matrix = []
n.times do |i|
  row = []
  n.times do |j|
    print "Enter element #{i+1},#{j+1}: "
    element = gets.chomp.to_i
    row << element
  end
  matrix << row
end

puts "Original matrix:"
n.times do |i|
  n.times do |j|
    print "#{matrix[i][j]} "
  end
  puts
end

n.times do |i|
  (i+1...n).each do |j|
    matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
  end
end


puts "Transposed matrix:"
n.times do |i|
  n.times do |j|
    print "#{matrix[i][j]} "
  end
  puts
end

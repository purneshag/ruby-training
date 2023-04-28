# Q. 4 and 5 --Write a method to double all the elements in an array.
#
def print_array_double
    puts "Enter the elements of the array:"
    input = gets.chomp.split(',')
    doubled_arr = input.map { |elem| [elem, elem] }.flatten 
    puts "Array with elements doubled: #{doubled_arr.inspect}"
end

print_array_double

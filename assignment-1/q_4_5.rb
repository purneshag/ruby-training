# Q. 4 and 5 --Write a method to double all the elements in an array.
#
def arr_inp
    puts "Enter the elements of the array:"
    return gets.chomp.split(',')
end

def print_array_double(arr)
    doubled_arr = arr.map { |elem| [elem, elem] }.flatten
end

def printarr(arr)
    puts "Array with elements doubled: #{arr.inspect}"
end

printarr(print_array_double(arr_inp))

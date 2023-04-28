#Q.3 ---To join tow array taking user input

def join_arrays(arr1, arr2)
    return arr1 + arr2
end
  
puts "Enter elements of 1st array:"
arr1 = gets.chomp.split(",").map(&:to_i)
  
puts "Enter elements of 2nd array:"
arr2 = gets.chomp.split(",").map(&:to_i)
  
final_arr = join_arrays(arr1, arr2)
puts "Final array after joining: #{final_array}"

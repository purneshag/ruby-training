#Q.3 ---To join tow array taking user input

def joined_array(list_1, list_2)
  return list_1 + list_2
end
  
def input_list
  return gets.chomp.split(",").map(&:to_i)
end
  
puts "Enter elements of 1st array:"
list_1 = input_list
puts "Enter elements of 2nd array:"
list_2 = input_list
puts "Joined array = #{joined_array(list_1, list_2)}"
